class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "You posted!"
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :subject)
  end

end
