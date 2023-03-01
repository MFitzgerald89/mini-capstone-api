Rails.application.routes.draw do
 
get "/all_products", controller: "products", action: "all_products"
get "/catback", controller: "products", action: "catback"
get "/alternator", controller: "products", action: "alternator"
end
