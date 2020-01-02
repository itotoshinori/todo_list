class TodosController < ApplicationController
  before_action :userid_set
  before_action :timeselect,   only: [:new,:create,:edit,:update]
  require 'date'
  require 'active_support/core_ext/date'
  def index
    @todos=Todo.includes(:accounts).where(finished:false).where(user_id:@userid).order(:term).paginate(page: params[:page], per_page: 20).order(created_at: "ASC")
    @kubun=1
  end
  def indexfinished
    @todos=Todo.where(finished:true).where(user_id:@userid).order(finishday: "DESC").paginate(page: params[:page], per_page: 20).order(created_at: "DESC")
    @kubun=2
  end

  def finished
    todo=Todo.find(params[:id])
    if params[:baction]=="1"
      todo.finished=true
      todo.finishday=Date.today
      todo.save
      flash[:success]="#{todo.title}が完了登録されました"
    else
      todo.finished=false
      todo.finishday=nil
      todo.save
      flash[:success]="#{todo.title}が完了登録取消されました"
    end
    redirect_to request.referer
  end
  def new
      now = Time.current
      sdate=now.since(1.days)
      @sdate=Date.new(sdate.year, sdate.month, sdate.day)
      @todo=Todo.new
  end
  def create
      @todo = Todo.new(todo_params)
      @todo.user_id=@userid
      starttimehour=@todo.starttimehour
      starttimemin=@todo.starttimemin
      @todo.starttime="2000-01-01 #{starttimehour}:#{starttimemin}".to_datetime if starttimehour.present? and starttimemin.present?
      
    if  @todo.save
      flash[:success]="#{@todo.title}が新規登録されました"
      if @todo.itemmoney.present?
        accountcreate
      else
        redirect_to "/todos/#{@todo.id}"
      end
    else
      flash[:success]="必須項目に入力がありません"
      @sdate=@todo.term
      @body=@todo.body
      render 'new'
    end
  end
  def accountcreate
    @account=Account.new(todo_id:@todo.id,item:@todo.item,amount:@todo.itemmoney,expense:false)
    @account.save
    flash[:success]="#{@todo.title}が会計も含め新規登録されました"
    redirect_to "/todos/#{@todo.id}"
  end
  
  def edit
    @url=request.referer
    @todo = Todo.find(params[:id])
  end
  def update
    if params[:commit]=="修正登録"
      @todo = Todo.find(params[:id])
        starttimehour=todo_params[:starttimehour]
        starttimemin=todo_params[:starttimemin]
        @todo.starttime="2000-01-01 #{starttimehour}:#{starttimemin}".to_datetime if starttimehour.present? and starttimemin.present?
      if @todo.update(todo_params)
        flash[:success]="「#{@todo.title}」が編集されました"
        redirect_to "/todos/#{@todo.id}"
      else
        flash[:success]="編集に失敗しました"
        render 'edit'
      end
    elsif params[:commit]=="コピー登録"
        @todo = Todo.new(todo_params)
        @todo.user_id=@userid
        starttimehour=@todo.starttimehour
        starttimemin=@todo.starttimemin
        @todo.starttime="2000-01-01 #{starttimehour}:#{starttimemin}".to_datetime if starttimehour.present? and starttimemin.present?
      if @todo.save
        flash[:success]="「#{@todo.title}」がコピー新規登録されました"
        redirect_to "/todos/#{@todo.id}"
      else
        flash[:success]="新規登録に失敗しました"
        render 'new'
      end
    elsif params[:commit]=="削除"
      @todo=Todo.find(params[:id])
      if @todo.destroy
        flash[:success]="「#{@todo.title}」が削除されました"
      else
        flash[:success]="「#{@todo.title}」の削除に失敗しました"
      end
      redirect_to '/todos/index'
    end
  end
  def show
    @todo=Todo.includes(:accounts).find(params[:id])
    @url=request.referer
  end
  def wshow
    @todo=Todo.includes(:accounts).find(params[:id])
    @url=request.referer
    render todos_wshow_path
  end
  def schedule
    require 'date'
    @event=Todo.where('starttime IS NOT NULL')
    kubun=params[:kubun]
    if kubun=="1"
      @date=params[:lday].to_date
    elsif kubun=="2"
      @date=params[:lday].to_date
    else
      @date = Date.today
    end
  end
  private
  def todo_params
     params.require(:todo).permit(:title, :body,:term,:starttimehour,:starttimemin,:item,:itemmoney)
  end
  def timeselect
    @hourselect=[*0..23]
    @minselect=[*0..59]
    now = Time.current
    @dates=Array.new()
    @idate=now.last_year
    (@idate.to_datetime..now.next_year).each do|c|
      date = Date.new(c.year, c.month, c.day)
      wd = ["日","月", "火", "水", "木", "金", "土"]
      iw=c.strftime("%Y/%m/%d(#{wd[c.wday]})")
      @dates << Datecollection.new(date,iw)
    end
  end
  def userid_set
    if cookies[:userid].present?
      @userid=cookies[:userid].to_i
      cookies[:userid] = {:value => @userid, :expires => 5.days.from_now }
    else
      redirect_to('/login/index') 
    end
  end
end
