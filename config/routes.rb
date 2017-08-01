Rails.application.routes.draw do
  resources :users
  resources :pets

  root 'home#index', as: 'home_index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
