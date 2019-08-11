Rails.application.routes.draw do

  resources :people, only: [:show,:create]
  
  resources :messages
  get :documentation, to: 'messages#documentation'


  root to: 'messages#index'

  namespace :api do
    namespace :v1 do
      post :messages, to: 'messages#create'
    end
  end



end
