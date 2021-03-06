# frozen_string_literal: true

Rails.application.routes.draw do
  post 'register' => 'users#create'
  post 'login' => 'authentication#login'
  post 'html_to_pdf' => 'pdf#create'
  post 'text_to_qr' => 'qr#create'
end
