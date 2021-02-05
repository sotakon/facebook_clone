Rails.application.routes.draw do
  root 'feeds#index'
  get 'sessions/new'
  resources :users, only: [:new, :create, :show]
  resources :feeds do
    collection do
      post :confirm
  resources :sessions, only: [:new, :create, :destroy]
    end
  end
end
