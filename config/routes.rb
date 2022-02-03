# frozen_string_literal: true

Rails.application.routes.draw do
  post 'register' => 'users#create'
  post 'login' => 'authentication#login'
  post 'html_to_pdf' => 'pdf#create'
end
