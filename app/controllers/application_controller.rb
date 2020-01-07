class ApplicationController < ActionController::Base
   
  protect_from_forgery with: :exception
  #protect_from_forgery with: :null_session
  include ApplicationHelper
  helper_method :current_user
  
  def current_user
    @current_user ||= User.find(cookies[:userid])
  end
end