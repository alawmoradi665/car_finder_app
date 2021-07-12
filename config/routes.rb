Rails.application.routes.draw do
  resources :reviews
  resources :listings
  resources :profiles
  devise_for :users
  get 'home/page'
root 'home#page'
end
