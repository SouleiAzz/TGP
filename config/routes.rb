Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  root 'dynamic#index'
  get 'contact', to: 'static#contact'
  get 'team', to: 'static#team'
  get 'welcome/:name', to: 'dynamic#welcome'
  resources :users, only: [:show, :new, :create]
  resources :cities, only: [:show]
  resources :gossips do
    resources :comments, only: [:edit, :update, :destroy, :create] do
      resources :likes, only: [:create, :destroy]
    end
    resources :likes, only: [:create, :destroy]
  end
  resources :sessions, only: [:new, :create, :destroy]
end
