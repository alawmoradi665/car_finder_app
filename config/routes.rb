Rails.application.routes.draw do
  post 'payment/page', to: "payment#create", as: 'payment'
  get 'paymeny/cancel', to: "payment#cancel", as: 'cancel'
  resources :reviews
  resources :listings
  resources :profiles
  devise_for :users
root 'home#page'
end
