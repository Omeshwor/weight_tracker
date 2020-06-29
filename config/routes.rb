Rails.application.routes.draw do
  root  'welcome#index'
  get    '/signup', to: 'users#new'
  get    '/login',  to: 'sessions#new'
  post   'login',   to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post  'user_weight', to: 'user_weights#create'
  # get   'user_weight', to: 'user_weights#show'

  resources :users
  resources :user_weights

end
