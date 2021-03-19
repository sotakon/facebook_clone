Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root 'feeds#index'
  get 'sessions/new'
  resources :users, only: [:new, :create, :show, :index]
  resources :feeds do
    resources :comments
    collection do
      post :confirm
  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
    end
  end
  resources :conversations do
  resources :messages
  end
end
