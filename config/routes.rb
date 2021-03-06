Rails.application.routes.draw do
  root  'welcome#index'
  get    '/signup', to: 'users#new'
  get    '/login',  to: 'sessions#new'
  post   'login',   to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :user_weights
  resources :friendships

end
