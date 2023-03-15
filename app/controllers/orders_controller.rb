class OrdersController < ApplicationController

  def create
   
    order = Order.new(
      
      product = Product.find_by(id: params[:product_id])
      
      subtotal = params[:quantity].to_i * product.price
      
      tax = subtotal * 0.09
      
      total = subtotal + tax
      
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity], 
      subtotal: subtotal,
      tax: tax,
      total: total
    )

    if order.save
    
      render json: order
    
    else
      render json: {errors: order.errors.full_messages}
    
    end

  end

  def show

    order_id = params[:id]
  
    order = Order.find_by(id: order_id)
  
    render json: order
  end

  def index
  
    order = Order.all

    render json: order

  end

end


