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
      redirect_to posts_path, notice: "Comment posted."
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :content)
  end
end
