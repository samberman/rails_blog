class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(params.require(:comment).permit(:body).merge(user: current_user, post_id: params[:post_id]))
    redirect_to post_path(@comment.post)
  end

  def update
    @comment = Comment.find(params[:id], post_id: params[:post_id], user_id: params[:user_id])
    @comment.update(params[:id])
    redirect_to post_path(post.user)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(params[:post_id])
  end

  # private

  # def comment_params
  #   params.require(:comment).permit(:user_id, :username, :post_id, :body)
  # end
end
