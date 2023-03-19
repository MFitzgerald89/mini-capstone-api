class CartedProductsController < ApplicationController

  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      order_id: nil,
      status: "Carted"
    )
    if carted_product.save
      render json: carted_product.as_json
    else
      render json: {errors: carted_product.errors.full_messages}, status: 422
    end

  end

  def index
    carted_product = current_user.carted_product

    render json: carted_product.as_json, status: "carted"
  end

  def destroy
  end

end
