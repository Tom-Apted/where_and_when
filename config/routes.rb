Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :matches, only: [:index] 

  resources :chatrooms, only: [:show, :index] do
    resources :messages, only: :create
  end



end
