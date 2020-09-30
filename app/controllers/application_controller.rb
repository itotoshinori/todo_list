class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  include ApplicationHelper
  helper_method :current_user
  require 'date'

  def userid_set
    if cookies[:userid].present?
      @userid=cookies[:userid].to_i
      #current_user
      cookies[:userid] = {:value => @userid, :expires => 5.days.from_now }
    else
      redirect_to('/login/index')
    end
  end

  def unless_user
    #@todo=Todo.includes(:accounts).find(params[:id])
    user = User.find(cookies[:userid].to_i)
    unless user.authenticate(session[:password])
      cookies.delete :userid
      redirect_to('/login/index')
    end
  end

  def unless_admin_user
    if cookies[:userid].present?
      redirect_to('/login/index') if cookies[:userid] != "1"
    end
  end
  def unless_login
    redirect_to('/login/index') if cookies[:userid].blank?
  end
end
