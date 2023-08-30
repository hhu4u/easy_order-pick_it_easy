# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Clearing database"
Product.destroy_all
Restaurant.destroy_all
User.destroy_all

puts "Creating users"
owner = User.new(first_name: "John", last_name: "Doe", email: "johndoe@mail.com", password: "123456")
owner.save
customer = User.new(first_name: "Julie", last_name: "Smith", email: "juliesmith@mail.com", password: "123456")
customer.save

puts "Creating restaurants"
restaurant = Restaurant.new(name: "Selecto", address: "Rue de Flandre 95, 1000 Bruxelles")
restaurant.user = owner
file = URI.open("https://www.royalfestival.be/wp-content/uploads/elementor/thumbs/Royal-Festival-de-Spa-2022-Dimanche-14-aout-31-q6lk609kkw7ivipjdobfafwdncq7oqw864m65uqun4.jpg")
restaurant.photo.attach(io: file, filename: "terasse.jpg", content_type: "image/jpg")
restaurant.save

restaurant.save

puts "Creating products"
file = URI.open("https://www.thecookierookie.com/wp-content/uploads/2023/04/featured-stovetop-burgers-recipe.jpg")
product1 = Product.new(name: "Hamburger classico", price: 12.00, description: "Tasty beef meet", dish_type: "Main Courses")
product1.restaurant = restaurant

product1.photo.attach(io: file, filename: "burger.jpg", content_type: "image/jpg")
product1.save

puts "Seeds completed"
