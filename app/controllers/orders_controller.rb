class OrdersController < ApplicationController

  def create
   
    order = Order.new{
      user_id: params[:current_user],
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: params[:subtotal],
      tax: params[:tax],
      total: params[:total]
    }

  end

end


