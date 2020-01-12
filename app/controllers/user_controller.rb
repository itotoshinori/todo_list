class UserController < ApplicationController
  def new
  end
  
  def create
    password=params[:password]
    password_confirmation=params[:password_confirmation]
    if password!=password_confirmation
     flash[:success]="パスワードが一致しません再入力して下さい"
     redirect_to '/user/new'
    end
    name=params[:name]
    email=params[:email]
    user = User.new(
      name:name, email:email,
      password:password) 
    if user.save
      cookies[:userid] = {:value => user.id, :expires => 5.days.from_now }
      flash[:success]="ユーザー登録されました"
    else
      flash[:success]="ユーザーに失敗しました。再度登録して下さい"
    end
    redirect_to '/'
  end

  def index
    @users=User.all
  end

  def edit
  end
end
