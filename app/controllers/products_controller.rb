class ProductsController < ApplicationController

def all_products

product = Product.all

render json: product.as_json

end 

def first_product

  first_product = Product.first

  render json: first_product.as_json

end

def second_product

  second_product = Product.second

  render json: second_product.as_json
end

end
