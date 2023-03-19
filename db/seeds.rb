Supplier.create!([
  {name: "Honda", email: "honda@test.com", phone_number: "5550000"},
  {name: "Rousch", email: "rousch@test.com", phone_number: "3330000"},
  {name: "Borla", email: "borla@test.com", phone_number: "1111111"}
])

Product.create!([
  {name: "Alternator", price: 350, description: "converts mechanical energy into electricity used by various car components", inventory: 1, supplier_id: 1},
  {name: "Catalytic Converter", price: 275, description: "exhaust emission control device that converts toxic gases and pollutants in exhaust gas from an internal combustion engine into less-toxic pollutants by catalyzing a redox reaction.", inventory: 1, supplier_id: 2},
  {name: "CatBack Exhaust", price: 1200, description: "exhaust system behind the catalytic converter", inventory: 1, supplier_id: 3}
])



Image.create!([
  {product_id: 1, url: "https://thumbs.dreamstime.com/b/car-engine-exhaust-header-car-engine-exhaust-header-part-automobile-industry-154603147.jpg", },
  {product_id: 2, url: "https://ic.carid.com/articles/are-headers-worth-performance-improvement/headers-collage_0.jpg"}
])

Carted_product.create!([
  {user_id: 1, product_id: 1, quantity: 1, status: true, order_id: 1},]
)