class CommentsController < ApplicationController
    def index
    @comment = Comment.new
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.find(params[:id][:user_id])
  end

  def create
    @Comment.create(body: params[:body], :user_id params[:user_id], post_id: params[:post_id])
    redirect_to post_path(@post.user)
  end

  def update
    @Comment = Comment.find(params[:id], post_id: params[:post_id], user_id: params[:user_id])
    redirect_to post_path(post.user)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    redirect_to "index.html.erb"
  end
end
