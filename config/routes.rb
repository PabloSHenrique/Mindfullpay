Rails.application.routes.draw do
  devise_for :users

  resources :subscriptions
  get "profile", to: "users#profile", as: "profile"

  root "subscriptions#index"
end
