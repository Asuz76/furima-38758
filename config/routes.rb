Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create]
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: :create
   end
end
