Rails.application.routes.draw do
  get 'movies/public/search'
  get 'movies/show'
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
scope module: :public do
  root to: "homes#top"
  resources :movies, only: [:index, :show, :create, :edit, :update, :destroy] do
  resources :post_comments, only: [:new, :create]
    resource :favorites, only: [:create, :destroy]
    resource :watches, only: [:create, :destroy, :index]
  end
  get '/customers/:id/favorites' => 'favorites#index', as: 'favorites'
  get '/customers/:id/watches' => 'watches#index', as: 'watches'
  get 'movies/search' => 'movies#search'
  get 'movies/:id/review' => 'movies#review', as: 'review'
  get 'homes/about' => 'homes#about', as: 'about'
  resources :messages, only: [:show, :index]
  resources :impressions, only: [:new, :create, :show, :edit, :update, :index]
  get '/customers/:id/comment' => 'customers#comment', as: 'comment'
  get '/customers/:customer_id/comment/:id' => 'customers#comment_detail', as: 'comment_detail'
  get 'customers/unsubscribe' => 'customers#unsubscribe'
  resources :customers, only: [:show, :edit, :update]
  patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
  delete '/customers/:id/comment' => 'customers#destroy', as: 'destroy_comment'
end

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
namespace :admin do
  root to: "homes#top"
  resources :messages, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :customers, only: [:index]
  get 'admin/comments' => 'customers#comments', as: 'comments'
end
end
# # resources :genres, only: [:index, :create, :edit, :update]
# # patch 'order_details/:id' => 'order_details#update'
# # resources :orders, only: [:show, :edit, :update]
# # post 'items' => 'items#create'
# # patch 'items/:id' => 'items#update'
# # patch 'customers/:id/edit' => 'customers#update'