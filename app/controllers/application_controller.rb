class ApplicationController < ActionController::Base
   
  protect_from_forgery with: :exception
  #protect_from_forgery with: :null_session
  include ApplicationHelper
  helper_method :current_user
  
  def userid_set
    if cookies[:userid].present?
      @userid=cookies[:userid].to_i
      #current_user
      cookies[:userid] = {:value => @userid, :expires => 5.days.from_now }
    else
      redirect_to('/login/index') 
    end
  end
end