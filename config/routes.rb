Rails.application.routes.draw do
  resources :users

  get 'admin/index'

  controller :sessions do
      get 'login' => :new
      post 'login' => :create
      delete 'logout' => :destroy
  end

  controller :pets do
    resources :pets
    get 'feed' => :feed
    get 'exercise' => :exercise
  end

  root 'home#index', as: 'home_index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
