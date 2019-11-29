Rails.application.routes.draw do
  root to: 'home#index'
  resources :manufacturers
  resources :subsidiaries, only: [:index, :show]
  resources :carcategories, only: [:index, :show]
end
