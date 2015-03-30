class InstaSessionsController < ApplicationController
  def connect
    redirect_to Instagram.authorize_url(redirect_uri: ENV['CALLBACK_URL'])
  end

  def callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => ENV['CALLBACK_URL'])
    session[:access_token] = response.access_token
    redirect_to posts_path
  end
end
