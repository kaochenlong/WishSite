Rails.application.routes.draw do
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"

  resource :user, as: "users" do
    collection do
      get :login   # /user/login
    end
  end

  resource :session, only: [:create, :destroy]

  resources :orders, only: [:create] do
    member do
      get :checkout
    end
  end

  resources :wish_lists do
    member do
      patch :like
      get :buy
    end

    resources :comments, shallow: true, only: [:create, :destroy]
  end

  root "wish_lists#index"
end
