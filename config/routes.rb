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
  get '/customers/unsubscribe' => 'customers#unsubscribe'
  resources :customers, only: [:show, :edit, :update]
  delete '/customers/:id/comment' => 'customers#destroy', as: 'destroy_comment'
  patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal' 
end

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
namespace :admin do
  root to: "homes#top"
  resources :messages, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :customers, only: [:index, :show]
  get '/comments' => 'customers#comments'
  get '/customers/:id/comments' => 'customers#customer_comments', as: 'customer_comments'
  get '/customers/:customer_id/comments/:id' => 'customers#comment_detail'
end
end