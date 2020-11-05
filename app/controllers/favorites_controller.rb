class FavoritesController < ApplicationController
  # いいね機能
  
  before_action :book_params

  def create
    Favorite.create(user_id: current_user.id, book_id: params[:id])
    redirect_back(fallback_location: root_path)

  end

  def destroy
    favorites = Favorite.find_by(user_id: current_user.id, book_id: params[:id])
    favorites.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def book_params
    @book = Book.find(params[:id])
  end
end
