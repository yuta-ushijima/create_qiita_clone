Rails.application.routes.draw do
  devise_for :users

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  namespace :api, { format: "json" } do
    namespace :v1 do
      resources :users
      resources :articles
      mount_devise_token_auth_for "User", at: "auth",
                                          controllers: { registrations: "api/auth/registrations" }
      post "/graphql", to: "graphql#execute"
    end
  end
end
