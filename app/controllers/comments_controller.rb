class CommentsController < ApplicationController
  def create
    @comment=Comment.new(comment_params)
    blog_id=@comment.blog_id
    if @comment.save
        redirect_to "/blogs/#{blog_id.to_s}"
    else
      @blog=Blog.find(blog_id)
      @name=@comment.name
      @body=@comment.body
      
      #redirect_to "/commens/comments_error"
      render comment_error_path
      #render "/commens/comments_error"
      #redirect_to "/blogs/#{blog_id.to_s}"
    end
  end
  def comment_error
     
    
  end
  def test
    
  end
  def comment_params
     params.require(:comment).permit(:name,:body,:blog_id)
  end
end