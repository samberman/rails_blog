class CommentsController < ApplicationController
    def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.find(params[:id][:user])
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
    redirect_to post_path
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :username, :post_id, :body)
  end
end
