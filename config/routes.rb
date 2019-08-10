Rails.application.routes.draw do

  resources :people, only: [:show]

  root :to => 'api/v1/messages#index'

  namespace :api do
    namespace :v1 do
      get '/messages', to: 'messages#index', as: "messages"
      post '/messages', to: 'messages#create'
    end
  end



end
