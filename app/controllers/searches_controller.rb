class SearchesController < ApplicationController
  
  def search
    value = params["search"]["areaid"]
    # how = params["search"]["how"]
    @datas = area_search_for(value)
    @post_image = Area.find(value).area_name
    @areas = Area.all
    
  end 
  
  
  private
  
  
  def area_search_for(value)
    PostImage.where(area_id: value)
    
  end 
  
end
