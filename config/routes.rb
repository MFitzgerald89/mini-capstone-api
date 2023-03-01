Rails.application.routes.draw do
 
get "/all_products", controller: "products", action: "all_products"
get "/first_product", controller: "first_product", action: "first_product"
get "/second_product", controller: "second_product", action: "second_product"
end
