class AreasController < ApplicationController

  def new
    @area = Area.new
    @areas = Area.all

  end

  def create
    area = Area.new(area_params)
    area.save
    redirect_to new_area_path

  end

  def index
    @areas = Area.all

  end

  def edit
    @area = Area.find(params[:id])
  
  end

  def update
    area = Area.find(params[:id])
    area.update(area_params)
    redirect_to new_area_path
    
  end
  
  def destroy
    area = Area.find(params[:id])
    area.destroy
    redirect_to new_area_path
    
  end 

  private

  def area_params
    params.require(:area).permit(:area_name)

  end

end
