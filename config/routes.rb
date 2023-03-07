Rails.application.routes.draw do
  devise_for :users
  root to: "browse#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  resources :browse, only: [:index]
  resources :swipes, only: [:create]

end
