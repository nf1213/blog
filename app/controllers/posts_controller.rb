class PostsController < ApplicationController
  before_action :authenticate, only: [:new, :create, :edit, :update]
  before_action :get_post, except: [:new, :create, :index]
  before_action :get_uploader, only: [:update, :create, :index, :show]

  def get_post
    @post = Post.find(params[:id])
  end

  def get_uploader
    @uploader = BlogImageUploader.new
  end

  def index
    @posts = Post.paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end

  def new
    @client = Instagram.client(access_token: session[:access_token])
    @post = Post.new
  end

  def create
    @uploader.store!(params[:image])
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "You posted!"
    else
      render :new
    end
  end

  def edit
    @client = Instagram.client(access_token: session[:access_token])
  end

  def update
    @uploader.store!(params[:image])
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
    params.require(:post).permit(:content, :subject, :blog_image, :instagram_link)
  end

end
