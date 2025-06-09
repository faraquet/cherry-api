# frozen_string_literal: true

require 'ferrum'
require 'base64'

class PdfController < ApplicationController
  def create
    params.permit!

    browser = Ferrum::Browser.new(timeout: 30, browser_options: { 'no-sandbox': nil })

    html_content = params[:content]
    data_url = "data:text/html;base64,#{Base64.strict_encode64(html_content)}"
    browser.go_to(data_url)

    pdf_options = {}.tap do |options|
      options[:landscape] = ActiveRecord::Type::Boolean.new.deserialize(params[:landscape]) if params[:landscape].present?
      options[:scale] = ActiveRecord::Type::Float.new.deserialize(params[:scale]) if params[:scale].present?
      options[:base64] = true  # Request PDF as base64 string
    end

    # Generate and decode PDF
    pdf_base64 = browser.pdf(**pdf_options)
    pdf_content = Base64.decode64(pdf_base64)

    # Send PDF directly to client
    send_data pdf_content,
      type: "application/pdf",
      filename: "document-#{DateTime.now.strftime('%Q')}.pdf"
  ensure
    browser&.quit
  end
end
