class CommentsController < ApplicationController
  before_action :authorize

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new(post: @post)
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    if @comment.save
      redirect_to post_path(@post), notice: "Comment posted."
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    unless current_user == @comment.user
      redirect_to post_path(@comment.post), notice: "You are not authorized!"
    end
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_path(@comment.post), notice: "Comment Edited"
    else
      render :update
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :content)
  end
end
