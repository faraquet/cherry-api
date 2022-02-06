# frozen_string_literal: true

require 'rqrcode'

class QrController < ApplicationController
  def create
    params.permit!

    qrcode = RQRCode::QRCode.new(params[:content])
    filename = "tmp/temp-qr-#{DateTime.now.strftime('%Q')}.png"

    qrcode.as_png(
      bit_depth: 1,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: 'black',
      file: filename,
      fill: 'white',
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120
    )

    send_file filename, type: 'png'
  end
end
