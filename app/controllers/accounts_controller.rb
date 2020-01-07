class AccountsController < ApplicationController
  #protect_from_forgery
  protect_from_forgery :except => [:index]
  require 'date'
  #before_action :current_user
  def index
    #userid=params[:id]
    userid=cookies[:userid]
    date=params[:registrationdate]
    @accounts=Account.joins(:todo).where('todos.user_id = ?', userid).where('registrationdate = ?',date)
    #@id=@current_user.id
  end
 
  def new
  
  end
  def create
    #@id=@current_user.id
    today=Date.today
    @account = Account.new(
      item:params[:item],
      amount:params[:amount],
      remark:params[:remark],
      todo_id:params[:id],
      registrationdate:today)
    if  @account.save
      flash[:success]="会計が新規登録されました"
    else 
      session[:item]=params[:item]
      session[:remark]=params[:remark]
      flash[:danger]="会計登録に失敗しました。必須項目に入力がありません。"
    end
    redirect_to "/todos/#{@account.todo_id}"
  end
  def editmany
    accountsmanyedit_params.each{|id,val|amount,remark,item,deletecheck = val.values_at("amount","remark","item","deletecheck")
      @account=Account.find(id)
      if deletecheck=="1"
        @account.destroy
      else
      @account.update(
        amount:amount,
        remark:remark,
        item:item)
      end
    }
    flash[:success] = "会計データを更新しました"
    redirect_to "/todos/#{@account.todo_id}"
  end
  private
  def accountsmanyedit_params
    params.permit(accountsmany: [:amount,:remark,:item,:deletecheck])[:accountsmany]
  end
end
