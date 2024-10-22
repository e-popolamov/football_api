require "sidekiq/web"

Sidekiq::Web.use ActionDispatch::Cookies
Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: "_interslice_session"

Rails.application.routes.draw do
  get "coefficients", to: "coefficient#index"
  get "player/:id", to: "player#show"
  get "roles", to: "role#index"
  get "role/:id", to: "role#show"
  get "games", to: "game#index"
  get "game/:id", to: "game#show"
  get "teams", to: "team#index"
  get "team/:id", to: "team#show"
  get "stats", to: "stat#index"

  mount Sidekiq::Web => "/sidekiq"
end
