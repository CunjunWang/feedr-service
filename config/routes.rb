Rails.application.routes.draw do
  resources :users
  get '/', to: 'sessions#welcome'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'signup', to: 'users#new'
  get 'welcome', to: 'sessions#welcome'
  get 'logout', to: 'sessions#logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resource :orders
  get '/orders/my', to: 'orders#my'
  get '/orders/detail/:order_no', to: 'orders#detail'
end
