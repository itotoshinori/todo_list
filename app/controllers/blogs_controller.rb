class BlogsController < ApplicationController
  before_action :userid_set,only: [:new,:create,:edit,:update]
  
  def index
    @blogs=Blog.paginate(page: params[:page], per_page: 5).order(created_at: "DESC")
  end

  def new
    @blog=Blog.new
  end
  
  def create
    @blog=Blog.new(blog_params)
    if @blog.save
      flash[:success]="正常に登録されました"
      redirect_to('/blogs/')
    else
      flash[:warning]="登録に失敗しました。必須項目に入力して下さい。"
      render 'new'
    end
  end

  def edit
    begin
      @blog = Blog.find(params[:id])
    rescue => exception
      redirect_to error_display_index_path
    end
  end
  
  def update
    @blog = Blog.find(params[:id])
    @blog.update(blog_params)
    flash[:success]="正常に更新されました"
    redirect_to('/blogs/')
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    flash[:success]="正常に削除されました"
    redirect_to('/blogs/')
  end

  def show
    begin
      @blog=Blog.find(params[:id])
      @commentcontent=Comment.where(blog_id:@blog.id)
      @comment=Comment.new
    rescue => exception
      redirect_to error_display_index_path
    end
  end
  
private
  def blog_params
     params.require(:blog).permit(:title, :content,:postdate)
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
