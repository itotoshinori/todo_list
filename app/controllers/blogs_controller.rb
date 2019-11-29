class BlogsController < ApplicationController
  def index
    @blog=Blog.all.order(created_at: "DESC")
  end

  def new
    @blog=Blog.new
  end
  
  def create
    @blog=Blog.new(blog_params)
    @blog.save
    redirect_to('/blogs/')
  end

  def edit
    @blog = Blog.find(params[:id])
  end
  
  def update
    @blog = Blog.find(params[:id])
    @blog.update(blog_params)
    redirect_to('/blogs/')
  end
  def show
    @blog=Blog.find(params[:id])
  end

  def blog_params
     params.require(:blog).permit(:title, :content,:postdate)
  end
end
