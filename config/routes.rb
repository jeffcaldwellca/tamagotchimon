Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/new'

  get 'sessions/destroy'

  resources :users
  resources :pets

  root 'home#index', as: 'home_index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
