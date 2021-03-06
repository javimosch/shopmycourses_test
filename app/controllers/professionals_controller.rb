class ProfessionalsController < ApplicationController
  
  def index
    @professionals = Professional.all
  end


  def new
    @professional = Professional.new
  end
  
  #resolve payload
  def item_params
    params.require(:professional).permit(:first_name, :last_name, :address,:phone,:specialty)
  end
  
  def create
    
    #new instance
    @professional = Professional.new item_params
    
    #set random avatar
    @professional.avatar = rand(1..15)
    
    if @professional.save
      redirect_to :action => 'index' #, :id => @professional.id
    else
      render :action => 'new'
    end
    
  end
  
  def destroy
    @professional = Professional.find params[:id]
    @professional.destroy
    redirect_to :action => 'index'
  end
  
  def edit
    @professional = Professional.find params[:id]
  end
  
  def update
    @professional = Professional.find params[:id]
    if @professional.update_attributes item_params
      redirect_to :action => 'index' #, :id => @professional.id
    end
  end
end
