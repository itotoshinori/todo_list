class LoginController < ApplicationController
  def index
    
  end
  def new
    @user=User.new()
  end

  def create
  end

  def login
    mail=params[:mail]
    password=params[:password]
    @user=User.find_by(email:mail)
    if @user and @user.authenticate(password)
      cookies[:userid] = {:value => @user.id, :expires => 5.days.from_now } 
      cookies.signed[:secret] = {
      :value => password,
      :expires => 5.days.from_now
     }
      flash[:success]="ログインに成功しました"
      ＃@chatwork = InquiryChatwork.new
      ＃@chatwork.push_chatwork_message(@user,2)
      redirect_to '/'
    else
      flash[:warning]="ログインに失敗しました"
      redirect_to login_index_path
    end
  end 
  
  def logout
    cookies.delete :userid
    cookies.delete :passwd
    redirect_to login_index_path
  end
end
