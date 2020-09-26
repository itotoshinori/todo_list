class UserController < ApplicationController
  before_action :userid_set
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
    if cookies[:userid].blank?
      flash[:warning]="ログインして下さい"
      redirect_to '/'
    else
      @user = User.find(@userid)
    end
  end
  
  def update
    email=User.find(cookies[:userid].to_i).email
    name = params[:name]
    pass=params[:password]
    newpass=params[:newpassword]
    passcon=params[:password_confirmation]
    @user=User.find_by(email:email)
    if newpass!=passcon
      flash[:warning]="パスワード確認の入力が異なります"
      redirect_to '/user/edit'
    elsif @user and @user.authenticate(pass)
      @user.password=newpass
      @user.name = name
      if @user.save
        flash[:success]="修正に成功しました"
      else
        flash[:warning]="修正に失敗しました。再度処理方願います。"
      end
      redirect_to '/'
    else
      flash[:warning]="パスワードの変更にに失敗しました。再度処理方願います。"
      redirect_to '/user/edit' 
    end
  end
  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:success]="削除に成功しました"
    redirect_to '/'
  end
end
