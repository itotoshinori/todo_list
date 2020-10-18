class UsersController < ApplicationController
  before_action :unless_admin_user
  def index
    @users = User.all
  end

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
      #cookies[:userid] = {:value => user.id, :expires => 5.days.from_now }
      flash[:success]="#{user.name}さんがユーザー登録されました"
    else
      flash[:success]="ユーザー登録に失敗しました。再度登録して下さい"
    end
    redirect_to '/'
  end

  def edit
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:success]="削除に成功しました"
    redirect_to '/'
  end
end
