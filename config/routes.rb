Rails.application.routes.draw do
  resources :users, only: [:new]
  #root'pages#home'
  get 'users/new'
  root 'static_pages#home'
  get 'home' => 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'signup' => 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
