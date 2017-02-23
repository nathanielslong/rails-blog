class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  before_action :find_comment, only: [:edit, :update, :show, :destroy]
  before_action :find_post, only: [:edit, :update, :show, :destroy]
  # New action for creating comment
  def new
    @comment = Post.find(params[:id]).comments.new
  end

  def edit
  end

  def update
    if @comment.update_attributes(comment_params)
      flash[:notice] = "Successfully updated post!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Error updating post!"
      render :edit
    end
  end

  private

  # sets the params we get with each post, need to add user_id eventually
  def comment_params 
    params.require(:comment).permit(:body)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
