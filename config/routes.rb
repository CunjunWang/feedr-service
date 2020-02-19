Rails.application.routes.draw do
  resources :users, only: [:new, :create, :test]
  get '/', to: 'sessions#welcome'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'signup', to: 'users#new'
  get 'users', to: 'users#new'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  get 'logout', to: 'sessions#logout'
  get 'me', to: 'users#me'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
