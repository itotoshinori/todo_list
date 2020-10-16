class SchedulesController < ApplicationController
  protect_from_forgery with: :exception
  before_action :userid_set
  before_action :unless_user,  only: [:index,:indexfinished,:show,:edit,:schedule]

  def index
    @event = Todo.where('starttime IS NOT NULL').where(user_id:@userid)
    kubun = params[:kubun]
    if kubun.present?
      @date = params[:lday].to_date
    else
      @date = Date.today
      @datekakuni = "true"
    end
  end
end
