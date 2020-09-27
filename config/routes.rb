Rails.application.routes.draw do
  root :to => 'root#top'

  devise_for :users, controllers: {
    sessions: 'users/sessions', 
    registrations: 'users/registrations'
  }

  # <%# 以下編集中%>
  # devise_scope :user do 
  #   get "user/" => "devise/sessions#new"
  # end

  # devise_for :user, :path => "/"
  # devise_for :user, :path_names => {:sign_in => "Login"}


  get "home/about" => "root#about"
  resources :books
  resources :users, only: [:index, :show, :edit, :update]
end
