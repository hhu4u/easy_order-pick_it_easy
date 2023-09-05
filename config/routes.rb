Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :restaurants, only: ["new", "create", "update", "edit", "show", "index"] do
    resources :products, only: ["index", "show", "new", "create", "edit", "update", "destroy"] do
      resources :orders, only: ["create", "edit", "update", "destroy"] do
      end
    end

    resources :tables, only: ["new", "create", "destroy", "index"] do
      resources :baskets, only: ["create", "destroy", "show"]
    end
  end
  post 'baskets/:id', to: 'baskets#confirm_basket', as: 'confirm'
  get 'pages', to: 'pages#loading'

  resources :baskets, only: :index

  resources :orders, only: ["destroy"]
end
