class ProductsController < ApplicationController

  before_action :authenticate_user, except: [:index, :show]

  def index
  @products = Product.all

  if params[:category]
    category = Category.find_by(name: params[:category])
  end

    # render using json (NO Template)
    # render json: @products, :include => [:supplier, :images]
  render template: "products/index"
  end



  def show
  product_id = params[:id]
  @product = Product.find_by(id: product_id)

    if params[:category]
      category = Category.find_by(name: params[:category])
    end

    # render using a template
    render template: "products/show"
  end


  def create
    @product = Product.create!(
      name: params[:name],
      price: params[:price],
      description: params[:description], 
      inventory: params[:inventory],
      supplier_id: params[:supplier_id]
    )

    if @product.save
      image = Image.new(product_id: @product.id ,url: params[:image])
      image.save
      # happy path i.e. successful
      render template: "products/show"
    else
      # sad path i.e. unsucessful
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end


  def update
    product_id = params[:id]
    @product = Product.find(product_id)
    @product.update(
      name: params[:name] || @product.name,
      price: params[:price] || @product.price,
      description: params[:description] || @product.description,
      inventory: params[:inventory] || @product.inventory,
      supplier_id: params[:supplier_id] || @product.supplier_id
    )
    
    if @product.valid?
      # happy path
      render template: "products/show"
    else
      # sad path
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end

  end


  def destroy
    product = Product.find(params[:id])
    product.destroy
    render json: {message: "Product successfully destroyed!"}
  end



end
