Rails.application.routes.draw do
  root :to => 'books#top'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # resources :books, only: [:show, :index, :edit, :create, :update, :destroy]
  resources :books
  resources :users, only: [:new, :show, :index, :edit, :create, :destroy]
end
