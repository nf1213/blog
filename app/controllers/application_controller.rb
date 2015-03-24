class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ApplicationHelper

  def authenticate
    unless is_nicole?
      redirect_to posts_path, alert: "You are not authorized, this is Nicole's Blog!"
    end
  end

  def authorize
    unless current_user
      redirect_to posts_path, alert: "Please sign in to comment."
    end
  end
end
