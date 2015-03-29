class StaticController < ApplicationController
  def about_nicole
    @client = Instagram.client(access_token: session[:access_token])
    @user = @client.user
  end
end
