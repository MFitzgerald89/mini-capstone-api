Rails.application.routes.draw do

### Product Routes
get "/products" => "products#index"
get "/products/:id" => "products#show"
post "/products" => "products#create"
patch "/products/:id" => "products#update"
delete "/products/:id" => "products#destroy"

### Supplier Routes
get "/suppliers" => "suppliers#index"
get "/suppliers/:id" => "suppliers#show"
post "/suppliers" => "suppliers#create"
patch "/suppliers/:id" => "suppliers#update"
delete "/suppliers/:id" => "suppliers#destroy"

### Image Routes
get "/images" => "images#index"
get "/images/:id" => "images#show"
post "/images" => "images#create"
patch "/images/:id" => "images#update"
delete "/images/:id" => "images#destroy"

### User Routes
post "/users" => "users#create"

### Session Routes
post "/sessions" => "sessions#create"


end
