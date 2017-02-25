class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  # Runs private methods defined lower before certain actions, in order to DRY up code
  before_action :find_comment, only: [:edit, :update, :show, :destroy]
  before_action :find_post, only: [:new, :create, :edit, :update, :show, :destroy]

  # New action for creating comment
  def new
    @comment = Comment.new
  end

  # Create action for new comment
  def create
    @comment = @post.comments.new
    @comment.update_attributes(comment_params)
    @comment.update_attributes(user_id: current_user.id)
    if @comment.save
      flash[:notice] = "Successfully created comment!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Error creating new comment!"
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update_attributes(comment_params)
      flash[:notice] = "Successfully updated comment!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Error updating comment!"
      render :edit
    end
  end

  def destroy
    if @comment.destroy
      flash[:notice] = "Successfully deleted comment!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Error deleting comment!"
    end
  end

  private

  # sets the params we get with each comment
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
