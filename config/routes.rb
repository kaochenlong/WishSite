Rails.application.routes.draw do
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"

  resource :user, as: "users" do
    collection do
      get :login   # /user/login
    end
  end

  resource :session, only: [:create, :destroy]

  resources :wish_lists

  root "wish_lists#index"
end
