Rails.application.routes.draw do

  resources :messages, only: [:new,:create,:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
