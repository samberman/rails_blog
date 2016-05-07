class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.find(params[:id][:user])
  end

  def create
    @post.create(params[:post])
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
    redirect_to posts_path
  end
end
