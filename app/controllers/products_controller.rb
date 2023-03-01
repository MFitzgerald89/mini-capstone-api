class ProductsController < ApplicationController

def all_products

product = Product.all

render json: product.as_json

end 

def catback

  catback = Product.first

  render json: catback.as_json

end

def alternator

  alternator = Product.second

  render json: alternator.as_json
end

end
