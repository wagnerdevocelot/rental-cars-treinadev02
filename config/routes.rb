Rails.application.routes.draw do
  root to: 'home#index'
  resources :manufacturers, only: [:index, :show, :new, :create] # fabricantes
  resources :subsidiaries, only: [:index, :show, :new, :create] # filiais
  resources :carcategories
end
