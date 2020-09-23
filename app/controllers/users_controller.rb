class UsersController < ApplicationController

  def new
    
  end
  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    
  end

  def update
    
  end

  private
  def user_params
    params.require(:user).permit(:name, :image, :body)
    
  end
end
