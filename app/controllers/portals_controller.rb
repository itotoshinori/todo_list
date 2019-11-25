class PortalsController < ApplicationController
  def index
    @portal=Portal.find(1)
  end

  def new
    @portal=Portal.new
  end
  def create
    @portal = Portal.new(portal_params)
    @portal.save
  end
  def edit
    @portal=Portal.find(params[:id])
  end
  def update
    @portal=Portal.update(portal_params)
    redirect_to('/')
  end
  private
  def portal_params
     params.require(:portal).permit(:title, :content)
  end
end