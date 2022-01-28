Rails.application.routes.draw do
  post "register" => "users#register"
  post "login" => "authentication#login"
  post "html_to_pdf" => "pdf#index"
end
