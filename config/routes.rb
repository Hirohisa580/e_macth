Rails.application.routes.draw do
  devise_for :users
  root to: "profiles#index"
  resources :profiles
  resources :dms, only: [:show, :new, :create] do
    resources :messages
  end
end
