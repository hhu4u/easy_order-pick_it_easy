Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :restaurants, only: ["new", "create", "update", "edit", "show", "index"] do
    resources :products, only: ["index", "show", "new", "create", "edit", "update", "destroy"] do
      resources :orders, only: ["create", "destroy"] do
      end
    end
  end
  resources :tables, only: ["create", "destroy", "index"] do
    resources :baskets, only: ["create", "destroy", "show"]
  end

  # resources :tables, only: ["index", "new", "create"] do
  #   member do
  #     get 'scan_qr_code/:restaurant_id/:table_number', action: :scan_qr_code, as: 'scan_qr_code'
  #   end
  # end
end
