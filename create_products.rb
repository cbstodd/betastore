require "./config/environment"

10.times do
  product = Product.new
  product.name = Faker::Commerce.product_name
  product.price = Faker::Commerce.price
  product.save

end

puts Product.count




