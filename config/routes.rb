Rails.application.routes.draw do

devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
# resources :items, only: [:index, :new, :create, :show, :edit, :update]
# resources :customers, only: [:index, :show, :edit, :update]
# resources :genres, only: [:index, :create, :edit, :update]
# patch 'order_details/:id' => 'order_details#update'
# resources :orders, only: [:show, :edit, :update]
# post 'items' => 'items#create'
# patch 'items/:id' => 'items#update'
# patch 'customers/:id/edit' => 'customers#update'
end

scope module: :public do
 root to:"homes#top"
 get 'movies/search'
 get 'movies/show'
 get'homes/about' => 'homes#about', as: 'about'
# resources :items, only: [:index, :show]
# delete '/cart_items/destroy_all' => 'cart_items#destroy_all', as: 'cart_items_destroy_all'
# resources :cart_items, only: [:index, :destroy, :create, :update]
# get 'orders/complete' => 'orders#complete'
# resources :orders, only: [:new, :create, :index, :show]
# resources :addresses, only: [:new, :index, :show, :create, :update, :destroy, :edit]
# get 'customers/unsubscribe' => 'customers#unsubscribe'
# get 'customers/information' => 'customers#show'
 resources :customers, only: [:show, ]
# get 'orders/confirm' => 'orders#confirm'
# patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
# post 'orders/confirm' => 'orders#confirm'
# post 'customers/information' => 'customers#new'
 end
end