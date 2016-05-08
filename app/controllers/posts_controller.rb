class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    # redirect_to posts_path @post
    # @post.user_id = 3
    # @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "Your post was added successfully!"
      redirect_to post_path @post
    else
      flash[:alert] = "Sorry, something went wrong."
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    redirect_to post_path(post.user)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :username, :title, :body)
  end
end
