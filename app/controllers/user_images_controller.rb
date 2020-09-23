class UserImagesController < ApplicationController

  def new
    @user_image = UserImage.new
  end

  def create
    @user_image = UserImage.new(user_image_params)
    @user_image.user_id = current_user.id
    if @user_image.save
      redirect_to user_images_path
    else
      render :new
    end
  end

  def index
    @user_images = UserImage.page(params[:page]).reverse_order
  end

  def show
    @user_image = PostImage.find(params[:id])
	  # @user_comment = PostComment.new
  end

	def destroy
    @user_image = UserImage.find(params[:id])
    @user_image.destroy
    redirect_to user_images_path
  end

  private
  def user_image_params
    params.require(:user_image).permit(:name, :image, )
    
  end
end
