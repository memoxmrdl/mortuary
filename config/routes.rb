Rails.application.routes.draw do
  root 'drawers#index'

  resources :drawers do
    resources :boxes, only: :show
  end

  resources :boxes
end
