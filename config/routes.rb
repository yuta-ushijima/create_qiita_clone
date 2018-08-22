Rails.application.routes.draw do

  devise_for :users

  namespace :api, { format: 'json'} do
    namespace :v1 do
      resources :users
      resource :login, only: [:create], controller: :sessions
      resource :logout, only: [:destroy], controller: :sessions
      resources :articles
    end
  end
end
