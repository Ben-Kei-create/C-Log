Rails.application.routes.draw do
  get 'movies/public/search'
  get 'movies/show'
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

scope module: :public do
  root to: "homes#top"
  #どちらが必要か？？↓createの部分
  resources :movies, only: [:index, :show, :create, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:new, :create, :index]
  end

  get 'movies/search' => 'movies#search'
  get 'movies/:id/review' => 'movies#review', as: 'review'
  get 'homes/about' => 'homes#about', as: 'about'
  resources :messages, only: [:show, :index]
  resources :impressions, only: [:new, :create, :show, :edit, :update, :index]
  get '/customers/:id/comment' => 'customers#comment', as: 'comment'
  get 'customers/unsubscribe' => 'customers#unsubscribe'
  resources :customers, only: [:show, :edit, :update]
  patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
# # # delete '/cart_items/destroy_all' => 'cart_items#destroy_all', as: 'cart_items_destroy_all'
# # # resources :cart_items, only: [:index, :destroy, :create, :update]
# # # get 'orders/complete' => 'orders#complete'
# # # resources :orders, only: [:new, :create, :index, :show]
# # # resources :addresses, only: [:new, :index, :show, :create, :update, :destroy, :edit]
# # # get 'customers/information' => 'customers#show'
# # # get 'orders/confirm' => 'orders#confirm'
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