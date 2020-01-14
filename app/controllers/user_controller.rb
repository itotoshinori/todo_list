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
    if cookies[:userid].blank?
      flash[:warning]="ログインして下さい"
      redirect_to '/'
    end
  end
  def update
    email=User.find(cookies[:userid].to_i).email
    pass=params[:password]
    newpass=params[:newpassword]
    passcon=params[:password_confirmation]
    @user=User.find_by(email:email)
    if newpass!=passcon
      flash[:warning]="パスワード確認の入力が異なります"
      redirect_to '/user/edit'
    elsif @user and @user.authenticate(pass)
      @user.password=newpass
      if @user.save
        flash[:success]="パスワードの変更に成功しました"
      else
        flash[:warning]="パスワードの変更にに失敗しました。再度処理方願います。"
      end
      redirect_to '/'
    else
      flash[:warning]="パスワードの変更にに失敗しました。再度処理方願います。"
      redirect_to '/user/edit' 
    end
  end 
end
