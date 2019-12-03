class CommentsController < ApplicationController
  def create
    @comments=Comment.new(comment_params)
    @comments.save
    redirect_to request.referer
  end
  def comment_params
     params.require(:comment).permit(:name,:body,:blog_id)
  end
end
