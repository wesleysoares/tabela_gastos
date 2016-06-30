Rails.application.routes.draw do
  root to: 'expenses#index'

  get 'receipt', to: 'receipts#index'
  get 'payment', to: 'payments#index'

  patch 'receipt.:id' => 'receipts#update'
  delete 'receipt.:id', to: 'receipts#destroy'

  resources :expenses, only: [:new, :create, :edit, :update, :destroy] do
    get "delete"
  end

  resources :receipts, only: [:new, :create, :edit, :update, :destroy] do
    get 'delete'
  end

  resources :payments
end
