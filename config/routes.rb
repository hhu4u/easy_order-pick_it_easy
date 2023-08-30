Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :restaurants, only: ["new", "create", "update", "edit", "show", "index"] do
    resources :products, only: ["index", "show", "new", "create", "edit", "update", "destroy"]
    resources :orders, only: ["create", "destroy"]
  end
end
