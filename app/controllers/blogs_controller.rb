class BlogsController < ApplicationController
  def index
    @blog=Blog.all
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
  end

  def blog_params
     params.require(:blog).permit(:title, :content,:postdate)
  end
end
