Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/new'
  get 'posts/edit'
  get 'posts/show'
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get    '/signup', to: 'users#new'
  post   '/signup', to: 'users#create'
  get    '/login' , to: 'sessions#new'
  post   '/login' , to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :posts
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
