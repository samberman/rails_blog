class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    # @user = User.find(params[:id])
    # @post = @user.posts.new(params[:post])
  end

  def create
    @post = Post.new(post_params)
    # redirect_to posts_path @post
    # @post.user_id = 3
    # @post.user_id = current_user.id
    
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
    @post.update(post_params)
    redirect_to @post
  end

  def edit
    @post = Post.find(params[:id])
  end
  def destroy
  #puts params.inspect("***********")
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :username, :title, :body).merge(user: current_user)
  end
end
