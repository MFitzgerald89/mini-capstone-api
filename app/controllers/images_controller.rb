class ImagesController < ApplicationController

  def index

    images = images.all
  
    render json: images,:include => [:supplier]
  
  end 
  
  def show
  
    images_id = params[:id]
    
    images = images.find_by(id: images_id)
  
    render json: images,:include => [:supplier]
  
  end 
  
  def destroy
    
    images = images.find_by(id: params["id"])
    
    images.destroy 
    
    render json:{message: "images removed"}
  
  end

end
