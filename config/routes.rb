Rails.application.routes.draw do
  get 'splash/index'

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy', as: :logout
  end

  devise_for :users
  resources :categories do
    resources :exchanges, only: [:index, :new, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "splash#index"
end
