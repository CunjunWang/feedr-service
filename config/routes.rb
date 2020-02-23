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
  get '/orders/checkout', to: 'orders#checkout'
  post '/orders/create', to: 'orders#place'
  post '/orders/update', to: 'orders#update_status'

  resources :foodtrucks do
    resources :menuitems do
      get 'add', to: 'menuitems#add'
      get 'remove', to: 'menuitems#remove'
    end
  end

end
