class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @feed = Post.feed(@user)
  end

  def follow
    current_user.follow!(User.find(params[:id]))

    flash[:notice] = "Successfully followed user!"

    redirect_to user_path(User.find(params[:id]))
  end

  def destroy
    Relationship.where(followed_id: params[:id], follower_id: current_user.id).destroy_all

    flash[:notice] = "Successfully stopped following user!"

    redirect_to user_path(User.find(params[:id]))
  end

end
