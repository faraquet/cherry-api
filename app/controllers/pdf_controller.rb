# frozen_string_literal: true

require 'ferrum'

class PdfController < ApplicationController
  def create
    params.permit!

    browser = Ferrum::Browser.new(timeout: 300, browser_options: { 'no-sandbox': nil })
    filename = "temp-pdf-#{DateTime.now.strftime('%Q')}"

    temp_html_path = "tmp/#{filename}.html"
    temp_pdf_path = "tmp/#{filename}.pdf"
    File.write(temp_html_path, params[:content])

    pdf_options = { path: temp_pdf_path }

    browser.go_to("file:///#{Rails.root.join("tmp/#{filename}.html")}")

    if params[:landscape].present?
      pdf_options[:landscape] =
        ActiveRecord::Type::Boolean.new.deserialize(params[:landscape])
    end

    if params[:scale].present? # rubocop:disable Style/IfUnlessModifier
      pdf_options[:scale] = ActiveRecord::Type::Float.new.deserialize(params[:scale])
    end

    browser.pdf(**pdf_options)

    pdf_content = File.read(temp_pdf_path)

    send_data pdf_content, type: "application/pdf", filename: "#{filename}.pdf"
  ensure
    browser&.quit

    [temp_html_path, temp_pdf_path].each do |path|
      File.delete(path) if File.exist?(path)
    end
  end
end
