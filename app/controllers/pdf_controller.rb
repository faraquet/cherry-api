class PdfController < ApplicationController
  def create
    browser = Ferrum::Browser.new
    filename = "temp-#{DateTime.now.strftime('%Q')}"
    File.open("tmp/#{filename}.html", "w") { |file| file.write(params[:content]) }

    browser.go_to("file:///#{Rails.root}/tmp/#{filename}.html")
    pdf_options = { path: "tmp/#{filename}.pdf" }

    pdf_options[:landscape] = ActiveRecord::Type::Boolean.new.deserialize(params[:landscape])

    browser.pdf(**pdf_options)

    send_file "tmp/#{filename}.pdf", type: "pdf"
  end
end
