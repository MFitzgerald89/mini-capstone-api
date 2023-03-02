require "http"

puts "Do you want to see all products?"

user_input = gets.chomp

while response == "yes".downcase

response = HTTP.get("http://localhost:3000/products")

products = response.parse(:json)

end

