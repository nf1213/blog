class PostsController < ApplicationController
  before_action :authenticate, only: [:new, :create, :edit, :update]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post), notice: "You posted!"
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "Post updated"
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:content, :subject)
  end

end
