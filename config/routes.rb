Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'books#index'

  post 'books' => 'books#create'
  get 'books' => 'books#index'

  get "books/:id" => 'books#show', as: 'book'

  
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  patch 'books/:id/show' => 'books#show', as: 'show_book'
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
end
