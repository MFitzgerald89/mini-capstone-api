class ProductsController < ApplicationController

require 'open-uri'
require 'net/http'
  
def remote_file_exists?(url)
  
  url = URI.parse(url)
  
  Net::HTTP.start(url.host, url.port) do |http|
    
    return http.head(url.request_uri)['Content-Type'].start_with? 'image'
  
  end
  
end

def index

product = Product.all

render json: product,:include => [:supplier]

end 

def show

  product_id = params[:id]
  
  product = Product.find_by(id: product_id)

  render json: product,:include => [:supplier]

end 

def create

  @product = Product.new(
    name: params[:name],
    price: params[:price],
    description: params[:description],
    url: params[:url],
    product_id: params[:product_id]
  )
  
  if @product.save
    render :json => @product,:include => [:supplier]
  else
    render :json => @product.errors.full_messages
    :status => unprocessable_entity
  end

end


def update
  
  product = Product.find_by(id: params["id"])
  
  product.update(
    name: params["name"] || product.name,
    price: params["price"] ||
    product.price, url: params["url"] || product.url,
    product_id: params["product_id"] || product.product_id
    description: params["description"] || product.description
  )

  if product.valid?
    render :json => product,:include => [:supplier]
  else
    render :json => product.errors.full_messages
    :status => unprocessable_entity
  end

end

def destroy
  
  product = Product.find_by(id: params[:id])
  
  product.destroy 
  
  render json:{message: "Product removed"}

end

end
