Rails.application.routes.draw do

  devise_for :adminsters
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :items, only:[:show]
  resources :orders, only:[:show, :index]
  resources :order_items
  resources :carts, only: [:show]
  resources :users, only: [:show, :edit, :update]
  resources :adminsters, only: [:top, :manage_users, :edit_user_details]

  root "top#index"
end
