Rails.application.routes.draw do

  resources :people, only: [:show,:create]

  root :to => 'api/v1/messages#index'

  namespace :api do
    namespace :v1 do
      get :messages, to: 'messages#index', as: "messages"
      post :messages, to: 'messages#create'

      post :custom_message, to: 'messages#custom_message'

      get :documentation, to: 'messages#documentation'

    end
  end



end
