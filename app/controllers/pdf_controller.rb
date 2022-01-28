class PdfController < ApplicationController
  def index
    render(json: { a: 1 })
  end
end
