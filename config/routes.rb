Rails.application.routes.draw do
  devise_for :customers
  get 'homes/top'
  root to: 'homes#top'
end
