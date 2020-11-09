Rails.application.routes.draw do
  root :to => 'root#top'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get "home/about" => "root#about"

  resources :users, only: [:index, :show, :edit, :update]

  # いいね機能
  post 'favorite/:id' => 'favorites#create', as: 'create_like'
  delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_like'

  # コメント機能
  resources :books do
    resources :book_comments, only: [:create, :destroy]
  end

end
