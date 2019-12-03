Rails.application.routes.draw do
  root to: 'home#index'
  resources :manufacturers
  resources :subsidiaries, only: [:index, :show, :new, :create] # filiais
  resources :car_categories
end
