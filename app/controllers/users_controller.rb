class UsersController < ApplicationController
  # before_action :signed_in_user, only:[]

  before_action :authenticate_user!, only: []
  before_action :login_check, {only: [:edit, :update, :show, :deestroy]}

  def index
    @book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
 
  end


  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path
      flash[:notice] = "You have updated user successfully."
    else
      render 'edit'
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
