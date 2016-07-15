Rails.application.routes.draw do
  get 'receipt', to: 'receipts#index'
  get 'payment', to: 'payments#index'

  patch 'receipt.:id', to: 'receipts#update'
  delete 'receipt.:id', to: 'receipts#destroy'

  patch 'payment.:id', to: 'payments#update'
  delete 'payment.:id', to: 'payments#destroy'

  resources :receipts, only: [:new, :create, :edit, :update, :destroy] do
    get 'delete'
  end

  resources :payments, only: [:new, :create, :edit, :update, :destroy]do
    get 'delete'
  end
end
