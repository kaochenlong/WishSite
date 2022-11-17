Rails.application.routes.draw do
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"

  resources :wish_lists

  root "wish_lists#index"
end
