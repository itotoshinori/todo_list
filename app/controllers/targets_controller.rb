class TargetsController < ApplicationController
  before_action :userid_set
  before_action :data_set  
  protect_from_forgery with: :exception

  def index
    @todo = Todo.new
    @date = params[:date] if params[:date].present?
    @targets = []
    @targets = @todo.todo_delete_target(@date,@userid)
  end

  def delete_many
    @todo = Todo.new
    @targets = [] 
    @targets = @todo.todo_delete_target(@date,@userid)
    @targets.each do | id,title,term |
      Todo.find(id).delete
    end
    redirect_to targets_path
  end
end