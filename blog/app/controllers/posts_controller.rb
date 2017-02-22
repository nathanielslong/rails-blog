class PostsController < ApplicationController
  # before most actions, check a user is actually logged in
  before_action :authenticate_user!, except: [:index, :show]
  # before the actions that require finding a specific post, finds that specific post
  before_action :find_post, only: [:edit, :update, :show, :destroy]

  # Index action to render all posts
  def index
    @posts = Post.all
  end

  # New action for creating post
  def new
    @post = Post.new
  end

  # Create action saves the post into database
  def create
    @post = Post.new
    @post.update_attributes(post_params)
    if @post.save
      flash[:notice] = "Successfully created post!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Error creating new post!"
      render :new
    end
  end

  # Edit action retrives the post and renders the edit page
  def edit
  end

  # Update action updates the post with the new information
  def update
    if @post.update_attributes(post_params)
      flash[:notice] = "Successfully updated post!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Error updating post!"
      render :edit
    end
  end

  # The show action renders the individual post after retrieving the the id
  def show
  end

  # The destroy action removes the post permanently from the database
  def destroy
    if @post.destroy
      flash[:notice] = "Successfully deleted post!"
      redirect_to posts_path
    else
      flash[:alert] = "Error updating post!"
    end
  end

  private

  # sets the params we get with each post, need to add user_id eventually
  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
