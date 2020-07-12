Rails.application.routes.draw do
  resources :users
  get 'sessions/new'
  root 'static_pages#home'
  get 'home' => 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'sign' => 'users#new'
  get 'users_list' => 'users#users_list'
  get 'search' => 'users#search'
  get 'login' => 'sessions#new'
  get 'follow_action' => 'users#follow_action'
  get 'unfollow_action' => 'users#unfollow_action'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :posts, only: [:create, :destroy]
  resources :reposts, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :users do
    member do
      get :followings, :followers
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
