class RelationshipsController < ApplicationController

  def create
    current_user.follow(params[:id])
    flash[:notice] = 'フォローしました'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.unfollow(params[:id])
    flash[:notice] = 'フォローを解除しました'
    redirect_back(fallback_location: root_path)
  end
end
