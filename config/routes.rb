Rails.application.routes.draw do

  get 'movies/public/search'
  get 'movies/show'
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

scope module: :public do
  root to: "homes#top"
  get 'movies/search' => 'movies#search'
  resources :movies, only: [:index, :show]
  get 'homes/about' => 'homes#about', as: 'about'
  resources :messages, only: [:show, :index]
  resources :impressions, only: [:new, :create, :show, :edit, :update, :index]
  get 'customers/unsubscribe' => 'customers#unsubscribe'
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  resources :post_comments, only: [:create]
  end
  resources :customers, only: [:show, :edit, :update]
# # # delete '/cart_items/destroy_all' => 'cart_items#destroy_all', as: 'cart_items_destroy_all'
# # # resources :cart_items, only: [:index, :destroy, :create, :update]
# # # get 'orders/complete' => 'orders#complete'
# # # resources :orders, only: [:new, :create, :index, :show]
# # # resources :addresses, only: [:new, :index, :show, :create, :update, :destroy, :edit]
# # # get 'customers/information' => 'customers#show'
# # # get 'orders/confirm' => 'orders#confirm'
  patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
# # # post 'orders/confirm' => 'orders#confirm'
# # # post 'customers/information' => 'customers#new'
end




devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


namespace :admin do
  root to: "homes#top"
  resources :messages, only: [:new, :create, :show, :edit, :update, :destroy]
# # resources :customers, only: [:index, :show, :edit, :update]
# # resources :genres, only: [:index, :create, :edit, :update]
# # patch 'order_details/:id' => 'order_details#update'
# # resources :orders, only: [:show, :edit, :update]
# # post 'items' => 'items#create'
# # patch 'items/:id' => 'items#update'
# # patch 'customers/:id/edit' => 'customers#update'
end

end