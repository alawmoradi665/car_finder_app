Rails.application.routes.draw do
  resources :reviews
  resources :listings
  resources :profiles
  devise_for :users
root 'home#page'
end
