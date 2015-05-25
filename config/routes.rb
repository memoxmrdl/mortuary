Rails.application.routes.draw do
  root 'drawers#index'

  resources :drawers
  resources :boxes
end
