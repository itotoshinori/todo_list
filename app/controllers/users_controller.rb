class UsersController < ApplicationController
  def index
    @users = User.all
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
