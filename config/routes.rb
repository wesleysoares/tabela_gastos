Rails.application.routes.draw do
  root to: 'expenses#index'

  get 'receipt', to: 'receipts#index'

  patch 'receipt.:id' => 'receipts#update'

  resources :expenses, only: [:new, :create, :edit, :update, :destroy] do
    get "delete"
  end

  resources :receipts
end
