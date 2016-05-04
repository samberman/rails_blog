class PostsController < ApplicationController
  def index
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.find(params[:id][:user_id])
  end

  def create
    @Post.create(body: params[:body], :user_id params[:user_id])
    redirect_to post_path(@post.user)
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
    redirect_to "index.html.erb"
  end
end
