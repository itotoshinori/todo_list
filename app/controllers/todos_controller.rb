class TodosController < ApplicationController
  protect_from_forgery :except => [:finishindex,:termindex]
  before_action :userid_set
  before_action :unless_user,  only: [:show,:edit]
  before_action :timeselect,   only: [:new,:create,:edit,:update,:index,:searchresult,:research]
  
  require 'active_support/core_ext/date'
  def modal

  end
  def index
    @todos=Todo.includes(:accounts).where(finished:false).where(user_id:@userid).order(:term).paginate(page: params[:page], per_page: 20).order(created_at: "ASC")
    @kubun=1
    #@hello ="ハローワールド！"
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
    #redirect_to "/todos/index"
    redirect_to request.referer
  end
  def finishindex
    date=params[:finishdate]
    @todos=Todo.where(finished:true).where(user_id:@userid).where(finishday:date).order(finishday: "DESC").order(created_at: "DESC")
  end
  def termindex
    date=params[:termdate]
    @todos=Todo.where(user_id:@userid).where(term:date).order(finishday: "DESC").order(created_at: "DESC")
    #render todos_finishindex_path
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
      @starttimehour=@todo.starttimehour
      @starttimemin=@todo.starttimemin
      newcreate
    if  @todo.save
      flash[:success]="#{@todo.title}が新規登録されました"
      accountcreate if @todo.itemmoney.present?
      if @todo.category_id.present? or @todo.category_id2.present? or @todo.category_id3.present?
        @categories = []
        @categories << @todo.category_id if @todo.category_id.present?
        @categories << @todo.category_id2 if @todo.category_id2.present?
        @categories << @todo.category_id3 if @todo.category_id3.present?
        @category = Category.new
        @category.category_insert(@categories,@todo.id) 
      end
      redirect_to "/todos/#{@todo.id}"
    else
      flash[:danger]="必須項目に入力がありません"
      @sdate=@todo.term
      @body=@todo.body
      render 'new'
    end
  end
  
  def accountcreate
    today=Date.today
    @account=Account.new(todo_id:@todo.id,item:@todo.item,amount:@todo.itemmoney,remark:@todo.remark,expense:false,registrationdate:today)
    @account.save
    flash[:success]="#{@todo.title}が会計も含め新規登録されました"
    #redirect_to "/todos/#{@todo.id}"
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
        if starttimehour.blank? or starttimemin.blank?
          @todo.starttime=nil
        else
          @todo.starttime="2000-01-01 #{starttimehour}:#{starttimemin}".to_datetime
          @todo.starttime=@todo.starttime-32400
        end
      if @todo.update(todo_params)
        category_update
        flash[:success]="「#{@todo.title}」が編集されました"
        redirect_to "/todos/#{@todo.id}"
      else
        flash[:danger]="編集に失敗しました"
        render 'edit'
      end
    elsif params[:commit]=="コピー登録"
      @todo = Todo.new(todo_params)
      @todo.user_id=@userid
      @starttimehour=@todo.starttimehour
      @starttimemin=@todo.starttimemin
      newcreate
      if @todo.save
        flash[:success]="「#{@todo.title}」がコピー新規登録されました"
        redirect_to "/todos/#{@todo.id}"
      else
        flash[:danger]="新規登録に失敗しました"
        render 'new'
      end
    elsif params[:commit]=="削除"
      @todo=Todo.find(params[:id])
      if @todo.destroy
        Category.where(todo_id:params[:id]).destroy_all
        flash[:success]="「#{@todo.title}」が削除されました"
      else
        flash[:danger]="「#{@todo.title}」の削除に失敗しました"
      end
      redirect_to session[:url]
    end
  end

  def  category_update
       @category_ids = Category.where(todo_id:@todo.id)
       @category_edit_ids = [todo_params[:category_id],todo_params[:category_id2],todo_params[:category_id3]] 
       count = 0
       @category_ids.each do | category |
        @category_edit_id = @category_edit_ids[count].to_i
        #debugger
        if @category_edit_id == 0
          category.destroy
        else
          category.category_id = @category_edit_id
          category.save
        end
        count = count + 1 
       end
       if count < 3
        for count in count..2 do
          if @category_edit_ids[count] != ""
            category = Category.new(category_id: @category_edit_ids[count].to_i,todo_id:@todo.id)
            category.save
          end
        end
       end 
  end
  
  def show
    @todo = Todo.includes(:accounts).find(params[:id])
    @categories = Category.where(todo_id:params[:id])
    @url=request.referer
  end

  def aggregate
    kubun=params[:kubun]
    if kubun.present?
      @date=params[:lday].to_date
    else
      @date = Date.today
    end
    @todos=Todo.where(user_id:@userid)
    @accounts=Account.joins(:todo).where('todos.user_id = ?', @userid)
  end

  def schedule
    @event=Todo.where('starttime IS NOT NULL').where(user_id:@userid)
    kubun=params[:kubun]
    if kubun.present?
      @date=params[:lday].to_date
    #elsif kubun=="2"
      #@date=params[:lday].to_date
    else
      @date = Date.today
      @datekakuni = "true"
    end
  end
  def createmany
    openday=params[:openday].to_date
    finishday=params[:finishday].to_date
    interval=params[:interval]
    title=params[:title]
    body=params[:body]
    count=0
    if title.present?
      while openday <= finishday
        @todo = Todo.new(
        term:openday,
        title:title,
        body:body,
        user_id:@userid)
        openday=openday.next_day(interval.to_i)
        @todo.save
        count+=1
      end
    end
    if count>0
      flash[:success]="「#{title}」が#{count}件追加されました"
    else
      flash[:warning]="登録に失敗しました。日付や必須項目等確認し再登録下さい。"
    end
    redirect_to request.referer
  end
  def search
    @now = Time.current
    now = Time.current
    sdate=now.prev_year
    fdate=now.since(3.month)
    @startdate=Date.new(sdate.year, sdate.month, sdate.day) if @startdate.blank?
    @finishdate=Date.new(fdate.year, fdate.month, fdate.day) if @finishdate.blank?
    @idate=Todo.minimum(:term)
    timeselect
  end
  def toexport
    now = Time.current
    sdate=now.prev_month
    fdate=now.since(3.month)
    @startdate=Date.new(sdate.year, sdate.month, sdate.day) if @startdate.blank?
    @finishdate=Date.new(fdate.year, fdate.month, fdate.day) if @finishdate.blank?
    @idate=Todo.minimum(:term)
    timeselect
  end
  def todocsvexport
    @startdate= params[:startdate][:id]
    @finishdate=params[:finishdate][:id]
    @todos=Todo.includes(:accounts).where(user_id:@userid).where("term >= ?", @startdate).where("term <= ?", @finishdate)
    flash[:success]="エクスポートしました"
  end
  def searchresult
    @title=params[:title]
    @startdate= params[:startdate][:id]
    @finishdate=params[:finishdate][:id]
    @todos=Todo.includes(:accounts).where(user_id:@userid).where('title LIKE ?', "%#{@title}%").where("term >= ?", @startdate).where("term <= ?", @finishdate).order(:term).paginate(page: params[:page], per_page: 20)
    @kubun=1
    if @todos.count>=100
      flash.now[:warning]="検索結果が100件を超えてます。絞り込みをお願いします"
      render todos_search_path
    elsif @todos.count==0
      flash.now[:warning]="該当データがありません。再設定をお願いします"
      render todos_search_path
    end
  end
  def research
    @title=params[:title]
    @startdate= params[:startdate]
    @finishdate=params[:finishdate]
    render todos_search_path
  end

  private
  def todo_params
     params.require(:todo).permit(:title, :body,:term,:starttimehour,:starttimemin,:item,:itemmoney,:remark,:category_id,:category_id2,:category_id3)
  end
  def timeselect
    @hourselect=[*0..23]
    @minselect=[*0..59]
    @interval=[*1..90]
    now = Time.current
    @dates=Array.new()
    @idate=now.last_year if @idate.blank?
    @ldate=now.next_year
    (@idate.to_datetime..@ldate).each do|c|
      date = Date.new(c.year, c.month, c.day)
      wd = ["日","月", "火", "水", "木", "金", "土"]
      iw=c.strftime("%Y/%m/%d(#{wd[c.wday]})")
      @dates << Datecollection.new(date,iw)
    end
  end

  def newcreate
    if @starttimehour.present? and @starttimemin.present?
      @todo.starttime="2000-01-01 #{@starttimehour}:#{@starttimemin}".to_datetime if @starttimehour.present? and @starttimemin.present?
      @todo.starttime=@todo.starttime-32400
    end
  end
end
