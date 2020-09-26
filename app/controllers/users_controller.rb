class UsersController < ApplicationController
  before_action :signed_in_user, only:[]

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
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to book_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
    
  end
end
