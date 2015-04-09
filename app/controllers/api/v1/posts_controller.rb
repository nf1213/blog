class Api::V1::PostsController < ApplicationController

  def index
    render json: Post.all
  end

  def show
    render json: Post.find(params[:id])
  end

  def create
    @uploader.store!(params[:blog_image])
    @post = Post.new(post_params)
    if @post.save
    else
      render json: { errors: @post.errors }, status: 422
    end
  end

  def update
    @uploader.store!(params[:blog_image])
    if @post.update(post_params)
    else
      render json: { errors: @post.errors }, status: 422
    end
  end

  def destroy
    @post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:content, :subject, :blog_image, :instagram_link)
  end

end
