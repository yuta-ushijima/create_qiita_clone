Rails.application.routes.draw do
  namespace :api, { format: "json" } do
    namespace :v1 do
      devise_for :users
      resources :users
      resource :login, only: [:create], controller: :sessions
      resource :logout, only: [:destroy], controller: :sessions
      resources :articles
    end
  end
end
