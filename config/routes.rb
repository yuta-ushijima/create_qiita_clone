Rails.application.routes.draw do
  devise_for :users

  namespace :api, { format: "json" } do
    namespace :v1 do
      resources :users
      resources :articles
      mount_devise_token_auth_for "User", at: "auth",
                                          controllers: { registrations: "api/auth/registrations" }
    end
  end
end
