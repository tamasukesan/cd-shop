Rails.application.routes.draw do

  devise_for :adminsters
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :items
  resources :orders, only:[:create,:show, :index]
  resources :order_items
  resources :carts, only: [:show,:create,:update,:destroy]
  resources :users, only: [:show, :edit, :update, :index, :destroy]
  resources :adminsters, only: [:show, :update, :destroy]

  get '/adminsters/users/:id' => 'adminsters#show_user', as: "adminsters_show_user"
  get '/adminsters/users' => 'adminsters#manage_users', as: "adminsters_manage_users"
  get '/adminsters/user/:id/edit(.:format)' => 'adminsters#edit_user_details', as: "adminsters_edit_user_details"


  root "top#index"
end
