Rails.application.routes.draw do
  # root :to => 'books#top'
  get 'users' => 'users/sessions', as: 'log_in'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'books#index'

  # my_page
  resources :users, only: [:show]

  # user
  get 'users/:id/show' => 'users#show', as: 'show_user'

  # 投稿機能
  post 'books' => 'books#create'
  get 'books' => 'books#index'

  # 投稿→詳細
  get "books/:id" => 'books#show', as: 'book'

  
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  patch 'books/:id/show' => 'books#show', as: 'show_book'
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
end
