require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end

  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "price", "description", "inventory", "supplier", "images"], data.keys
  end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json", params: { supplier_id: Supplier.first.id, name: "Lego Millennium Falcon", price: 800, description: "Defend the Galaxy and build the largest LEGO Star Wars Millennium Falcon to date! The perfect set for adult Star Wars fans and expert builders, This starship will inspire hours of play recreating the films or can be displayed as a collectible toy model" }
      assert_response 200
    end

    post "/products.json", params: {}
    assert_response 422

  end

  test "update" do
    product = Product.second
    patch "/products/#{product.id}.json", params: { name: "Updated name" }

    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
    assert_equal product.price, data["price"].to_i
    assert_equal product.description, data["description"]

    patch "/products/#{product.id}.json", params: { name: "" }
    assert_response 422
  end

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json"
      assert_response 200
    end
  end

end