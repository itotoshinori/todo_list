class PortalsController < ApplicationController
  def index
<<<<<<< HEAD
    if Portal.count>0
      @portal=Portal.find(1)
    else
      @portal=nil  
=======
    if Portal.count > 0
      @portal = Portal.find(1)
    else
      @portal = nil
>>>>>>> 33fa1633e134c2010ce7077128c831f35b1d3701
    end
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