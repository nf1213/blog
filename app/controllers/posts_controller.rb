class PostsController < ApplicationController
  before_action :authenticate, only: [:new, :create, :edit, :update]
  before_action :get_post, except: [:new, :create, :index]

  def get_post
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "You posted!"
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post updated"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post deleted"
  end

  private

  def post_params
    params.require(:post).permit(:content, :subject)
  end

end
