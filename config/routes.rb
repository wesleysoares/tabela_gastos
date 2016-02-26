Rails.application.routes.draw do
  root to: 'expenses#index'

  resources :expenses, only: [:new, :create, :edit, :update]
end
