class AreasController < ApplicationController
  
  def new
    @area = Area.new
    
  end 
  
  def create
    area = Area.new(area_params)
    area.save
    redirect_to areas_path
    
  end 
  
  def index
    @areas = Area.all
    
  end 
  
  def edit
  end 
  
  def update
  end 
  
  private
  
  def area_params
    params.require(:area).permit(:area_name)
    
  end 
  
end
