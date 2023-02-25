Rails.application.routes.draw do
  root to: 'rooms#index'

  resources :rooms, only: [:create, :index, :show, :destroy], param: :token

  resources :rooms do
    resources :messages, only: [:create]
  end

  resources :users, only: %i[new destroy]

  mount ActionCable.server => '/cable'
end
