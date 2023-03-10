class ProductsController < ApplicationController


def index
  pp current_user.name
  pp current_user.email
  pp current_user.id
  product = Product.all

  render json: product,:include => [:supplier, :images]

end 

def show

  product_id = params[:id]
  
  product = Product.find_by(id: product_id)

  render json: product,:include => [:supplier, :images]

end 

def create
  
  product = Product.new(
    name: params[:name],
    price: params[:price],
    total: params[:total],
    description: params[:description],
    supplier_id: params[:supplier_id]
  )
  
  if product.save
    image = Image.new(product_id: product.id, url: params[:url])
    render :json => product,:include => [:supplier]
  else
    render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
  end

end


def update
  
  product = Product.find_by(id: params["id"])
  
  product.update(
    
  name: params["name"] || product.name,
  price: params["price"] ||    product.price,
  supplier_id: params["supplier_id"] || product.supplier_id,
  description: params["description"] || product.description,
  total: params["total"] || product.total
  )

  if product.valid?
    render :json => product,:include => [:supplier]
  else
    render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
  end

end

def destroy
  
  product = Product.find_by(id: params["id"])
  
  product.destroy 
  
  render json:{message: "Product removed"}

end


end
