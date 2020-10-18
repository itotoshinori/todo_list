class PasswordChangeController < ApplicationController
  protect_from_forgery with: :exception
  before_action :userid_set
  before_action :unless_user

  def edit
    @user = User.find(@userid)
  end

  def update
    #email = User.find(@userid).email
    name = params[:name]
    pass = params[:password]
    newpass = params[:newpassword]
    passcon = params[:password_confirmation]
    @user = User.find(@userid)
    #debugger
    if newpass!=passcon
      flash[:warning]="パスワード確認の入力が異なります"
      redirect_to '/user/edit'
    elsif @user and @user.authenticate(pass)
      @user.password = newpass
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
end
