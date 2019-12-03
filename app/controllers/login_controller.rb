class LoginController < ApplicationController
  def index
    #cookie[:user_id] = @user.id
  end
  def login
    if params[:password]=="654321"
      cookies.signed[:passwd] = {:value => "OK", :expires => 1.days.from_now } 
      #cookies[:passwd] = { :value => "OK", :expires => "30.days.from_now",:secure => true }
      redirect_to('/')
    elsif params[:commit] == "ログアウト"
      cookies.delete :passwd
      redirect_to('/')
    else
      redirect_to('/login/index')
    end
    
  end
end
