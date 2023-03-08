class SupplierController < ApplicationController
  def index
    supplier = Supplier.all

    render json: supplier.as_json
  end

  def create
    supplier = Supplier.new(
    name: params[:name],
    email: params[:email],
    phone_number: params[:phone_number]
    )
    render json: supplier.as_json
  end

  def show
    supplier_id = params[:id]

    supplier = Supplier.find_by[id: supplier_id]

    render json: supplier.as_json
  end

  def update
    supplier = Supplier.find_by(id: params["id"])

    supplier.update(
      name: params["name"] || supplier.name,
      email: params["email"] || supplier.email,
      phone_number: params["phone_number"] || suppler.phone_number
    )
  end

  def destroy

    supplier = Supplier.find_by(id: params[:id])

    supplier.destroy

    render  json:{message: "Supplier Removed"}
  end
end
