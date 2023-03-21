class CartedProductsController < ApplicationController
  before_action :authenticate_user
  
  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    render template: "carted_products"
  end
  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      order_id: nil, 
      status: "carted"
    )
    if @carted_product.save
      # happy path
      render template: "carted_products#show"
    else
      # sad path
      render json: {errors: @carted_product.errors.full_messages}, status: 422
    end
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.update(status: "removed")
    render json: {message: "Item has been removed from your cart!"}
  end

end
