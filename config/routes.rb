Rails.application.routes.draw do
  resources :reservations
  resources :rooms do
    resources :reservations
    collection do
      get 'search'
    end
  end
  devise_for :users
  root 'top#index'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
