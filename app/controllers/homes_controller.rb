class HomesController < ApplicationController
  before_action :signed_in
  
  def top 
  end 
  
  def signed_in
    if user_signed_in?
      redirect_to user_path(current_user.id) 
      
    end
  end 
  
end
