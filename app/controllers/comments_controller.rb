class CommentsController < ApplicationController
  before_action :authorize
  before_action :get_post

  def get_post
    @post = Post.find(params[:post_id])
  end

  def new
    @comment = Comment.new(post: @post)
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @post, notice: "Comment posted."
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    unless current_user == @comment.user
      redirect_to @post, notice: "You are not authorized!"
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @post, notice: "Comment Edited"
    else
      render :update
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to @post, notice: "Comment Deleted"
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :content)
  end
end
