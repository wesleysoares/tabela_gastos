Rails.application.routes.draw do
  root to: 'expenses#index'

  get 'receipt', to: 'receipts#index'

  resources :expenses, only: [:new, :create, :edit, :update, :destroy] do
    get "delete"
  end

  resources :receipts, only: [:new, :create]
end
