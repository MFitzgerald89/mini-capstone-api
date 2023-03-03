class ProductsController < ApplicationController

def index

product = Product.all

render json: product.as_json

end 

def show

  product_id = params[:id]
  
  product = Product.find_by(id: product_id)

  render json: product.as_json

end 

def create

  product = Product.new(

  name: "Catalytic Converter",
  price: 275,
  image_url: "https://orozcosautoservice.com/wp-content/uploads/Depositphotos_116259460_XL2.jpg",
  description: "exhaust emission control device that converts toxic gases and pollutants in exhaust gas from an internal combustion engine into less-toxic pollutants by catalyzing a redox reaction."
  )
  
  product.save
  render json: product.as_json

end

def update
  
  product = Product.find_by(id: params["id"])
  
  product.update(
    name: params["name"] || product.name,
    price: params["price"] ||
    product.price,
    image_url: params["image_url"] || product.image_url,
    description: params["description"] || product.description
  )

  render json: product.as_json
end

def destroy
  product = Product.find_by(id: params[:id])
  product.destroy  
  
  render json:{message: "Product removed"}


end
end
