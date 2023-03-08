Rails.application.routes.draw do
  devise_for :users
  root to: "browse#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :matches, only: [:index]

  resources :chatrooms, only: [:show, :index] do
    resources :messages, only: :create
    resources :suggested_dates, only: [:create]
  end


  resources :browse, only: [:index]
  resources :swipes, only: [:create]


end
