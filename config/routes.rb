Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'books#index'

  post 'books' => 'books#create'
  get 'books' => 'books#index'

  get "books/:id" => 'books#show', as: 'book'


end
