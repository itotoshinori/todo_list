class AccountsController < ApplicationController
  def new
  
  end
  def create
    @account = Account.new(
      item:params[:item],
      amount:params[:amount],
      remark:params[:remark],
      todo_id:params[:id])
    if  @account.save
      flash[:success]="会計が新規登録されました"
    else 
      flash[:danger]="会計登録に失敗しました。必須項目に入力がありません。"
    end
    redirect_to "/todos/#{@account.todo_id}"
  end
end
