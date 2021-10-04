Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :stores
  devise_for :users

  
  get 'gallery/index'
  post 'gallery/index'
  delete 'gallery/index'
  post 'gallery/checkout'
  get 'gallery/checkout'
  get 'gallery/purchase_complete'
  post 'gallery/purchase_complete'
  get 'gallery/query'
  post 'gallery/query'
  
  get 'admin/login'
  
  get 'home/index'
  root 'gallery#index'
  
  get '/admin/logout'
  post '/admin/login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
