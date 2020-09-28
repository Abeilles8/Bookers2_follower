class UsersController < ApplicationController
  before_action :signed_in_user, only:[]
  # before_action :correct_user, only:[]

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    # if @book.user == current_user
    #   render "edit"
    # else
      # redirect_to books_path
    # end
    
  end

  def index
    @book = Book.new
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
    
  end
end
