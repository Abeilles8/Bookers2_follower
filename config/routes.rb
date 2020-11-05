Rails.application.routes.draw do
  root :to => 'root#top'

  devise_for :users, controllers: {
    sessions: 'users/sessions', 
    registrations: 'users/registrations'
  }

  get "home/about" => "root#about"
  resources :books
  resources :users, only: [:index, :show, :edit, :update]
  
  # いいね機能
  post 'favorite/:id' => 'favorites#create', as: 'create_like'
  delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_like'
end
