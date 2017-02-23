class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: params[:id])
  end

  def follow
    current_user.follow!(User.find(params[:id]))
  end

end
