class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ApplicationHelper
  
  def authenticate
    unless is_nicole?
      redirect_to posts_path, alert: "You are not authorized to post on Nicole's Blog!"
    end
  end
end
