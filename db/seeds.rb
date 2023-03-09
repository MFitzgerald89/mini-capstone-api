# Product.create!([
#   {name: "Alternator", price: 350, image_url: "fish", description: "converts mechanical energy into electricity used by various car components", inventory: 1, supplier_id: 1},
#   {name: "Catalytic Converter", price: 275, image_url: "https://orozcosautoservice.com/wp-content/uploads/Depositphotos_116259460_XL2.jpg", description: "exhaust emission control device that converts toxic gases and pollutants in exhaust gas from an internal combustion engine into less-toxic pollutants by catalyzing a redox reaction.", inventory: 1, supplier_id: 2},
#   {name: "CatBack Exhaust", price: 1200, image_url: "https://turn5.scene7.com/is/image/Turn5/CH6913?wid=810&hei=608&op_usm=0.8,1,10,0", description: "exhaust system behind the catalytic converter", inventory: 1, supplier_id: 3}
# ])

# Supplier.create!([
#   {name: "Honda", email: "honda@test.com", phone_number: "5550000"},
#   {name: "Rousch", email: "rousch@test.com", phone_number: "3330000"},
#   {name: "Borla", email: "borla@test.com", phone_number: "1111111"}
# ])

Image.create!([
  {url: "https://thumbs.dreamstime.com/b/car-engine-exhaust-header-car-engine-exhaust-header-part-automobile-industry-154603147.jpg", product_id: 1},
  {url: "https://ic.carid.com/articles/are-headers-worth-performance-improvement/headers-collage_0.jpg", product_id: 1}
])