Rails.application.routes.draw do
  devise_for :users
  get 'home/page'
root 'home#page'
end
