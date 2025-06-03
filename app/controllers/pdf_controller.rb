# frozen_string_literal: true

require 'ferrum'

class PdfController < ApplicationController
  def create
    params.permit!

    # Create a data URL instead of writing to file
    html_content = params[:content]
    encoded_html = Base64.strict_encode64(html_content)
    data_url = "data:text/html;base64,#{encoded_html}"

    browser = Ferrum::Browser.new(
      timeout: 30,
      headless: true,
      browser_options: {
        'no-sandbox': nil,
        'disable-web-security': nil,
        'allow-file-access-from-files': nil
      }
    )

    begin
      browser.go_to(data_url)
    rescue => e
      Rails.logger.error "Browser navigation failed: #{e.message}"
      raise e
    end

    # Generate PDF in memory (no path specified)
    pdf_options = {}

    if params[:landscape].present?
      pdf_options[:landscape] =
        ActiveRecord::Type::Boolean.new.deserialize(params[:landscape])
    end

    if params[:scale].present?
      pdf_options[:scale] = ActiveRecord::Type::Float.new.deserialize(params[:scale])
    end

    # Get PDF as binary data
    pdf_data = browser.pdf(**pdf_options)

    # Send the PDF data directly without writing to file
    send_data pdf_data,
      type: 'application/pdf',
      filename: "generated-#{DateTime.now.strftime('%Y%m%d_%H%M%S')}.pdf",
      disposition: 'attachment'

  ensure
    browser&.quit
  end
end
