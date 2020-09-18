Rails.application.routes.draw do
  devise_for :users
  root :to => 'books#index'

  post 'books' => 'books#create'
  get 'books' => 'books#index'

  get "books/:id" => 'books#show', as: 'book'


end
