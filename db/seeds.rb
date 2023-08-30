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

puts "Creating products"
file = URI.open("https://www.thecookierookie.com/wp-content/uploads/2023/04/featured-stovetop-burgers-recipe.jpg")
product1 = Product.new(name: "Hamburger classico", price: 12.00, description: "Tasty beef meet", dish_type: "Main Courses")
file = URI.open("https://wallpapercave.com/wp/wp1987065.jpg")
product1.photo.attach(io: file, filename: "1.jpg", content_type: "image/jpg")
product1.restaurant = restaurant
product1.photo.attach(io: file, filename: "burger.jpg", content_type: "image/jpg")
product1.save

product2 = Product.new(name: "Real Italian Lasagna", price: 18.00, description: "Crispy and golden on the outside and juicy in the middle, so delicious ", dish_type: "Main Courses")
file = URI.open("https://www.finedininglovers.com/sites/g/files/xknfdk626/files/styles/recipes_1200_800/public/2022-11/THE_SECRET_OF_ITALIAN_FOOD_LASAGNA_00.jpeg.webp?itok=VELk23pO")
product2.photo.attach(io: file, filename: "2.jpg", content_type: "image/jpg")
product2.restaurant = restaurant
product2.save


product3 = Product.new(name: "Tagliatelle with Ragù Bolognese", price: 15.00, description: "This dish can be more representative of the Bolognese tradition than ragù Bolognese with tagliatelle", dish_type: "Main Courses")
file = URI.open("https://www.finedininglovers.com/sites/g/files/xknfdk626/files/styles/recipes_1200_800/public/2021-03/ragu_bolognese.jpg.webp?itok=ZGXPM0Lv")
product3.photo.attach(io: file, filename: "3.jpg", content_type: "image/jpg")
product3.restaurant = restaurant
product3.save

product4 = Product.new(name: "Shepherd's Pie", price: 17.00, description: "Delicious Shepherd's Pie topped with crispy potatoes", dish_type: "Main Courses")
file = URI.open("https://www.finedininglovers.com/sites/g/files/xknfdk626/files/styles/recipes_1200_800/public/Original_18258_gluten-free-shepherd-pie.jpg.webp?itok=rL9XN1cu")
product4.photo.attach(io: file, filename: "4.jpg", content_type: "image/jpg")
product4.restaurant = restaurant
product4.save

product5 = Product.new(name: "Tofu Laksa with Noodles", price: 17.00, description: "delicious tofu laksa, a vegetarian version of the Malaysian-spiced soup served with noodles.", dish_type: "Main Courses")
file = URI.open("https://www.finedininglovers.com/sites/g/files/xknfdk626/files/styles/recipes_1200_800/public/Original_18221_vegetarian-laska-tofu-noodles-dairy-free.jpg.webp?itok=xuTT-krL")
product5.photo.attach(io: file, filename: "5.jpg", content_type: "image/jpg")
product5.restaurant = restaurant
product5.save

product6 = Product.new(name: "Deep-Fried Calamari with Aioli", price: 12.00, description: "The perfect balance of textures and flavors makes this a classic starter.", dish_type: "Starters")
file = URI.open("https://bing.com/th?id=OSK.62dffd3fe5ce4731030d9858ccf7bd5a")
product6.photo.attach(io: file, filename: "6.jpg", content_type: "image/jpg")
product6.restaurant = restaurant
product6.save


product7 = Product.new(name: "Mozzarella Caprese Skewers", price: 10.00, description: "These colorful caprese salad skewers with bite-sized portions are perfect for holiday parties", dish_type: "Starters")
file = URI.open("https://thumbs.dreamstime.com/b/fresh-tomato-mozzarella-balls-basil-platter-plate-toothpicks-55833406.jpg")
product7.photo.attach(io: file, filename: "7.jpg", content_type: "image/jpg")
product7.restaurant = restaurant
product7.save


product8 = Product.new(name: "Crispy Spring Rolls", price: 8.00, description: "Delight in these crispy spring rolls filled with a medley of vegetables and vermicelli noodles", dish_type: "Starters")
file = URI.open("https://www.tasteofhome.com/wp-content/uploads/2018/01/Easy-Egg-Rolls_EXPS_FT21_13235_F_1029_1.jpg?fit=700,1024")
product8.photo.attach(io: file, filename: "8.jpg", content_type: "image/jpg")
product8.restaurant = restaurant
product8.save

product9 = Product.new(name: "Chicken Satay Skewers", price: 8.00, description: "Embark on an Asian culinary journey with these tender chicken skewers marinated in fragrant spices and served with a rich peanut sauce.", dish_type: "Starters")
file = URI.open("https://www.aheadofthyme.com/wp-content/uploads/2020/07/satay-chicken-skewers-with-peanut-sauce-8.jpg")
product9.photo.attach(io: file, filename: "9.jpg", content_type: "image/jpg")
product9.restaurant = restaurant
product9.save

product10 = Product.new(name: "Tiramisu", price: 10.00, description: "Tiramisu is a sophisticated dessert with layers of coffee-soaked ladyfingers and creamy mascarpone mixture.", dish_type: "Desserts")
file = URI.open("https://th.bing.com/th/id/R.743fbf4cf71f1f43020e981be7e03121?rik=t46AyC8d5qxl4Q&pid=ImgRaw&r=0")
product10.photo.attach(io: file, filename: "10.jpg", content_type: "image/jpg")
product10.restaurant = restaurant
product10.save

product11 = Product.new(name: "Fruit Parfait", price: 12.00, description: "A fruit parfait is a refreshing and healthier dessert option. The layers of Greek yogurt, granola, and fresh fruits provide a satisfying mix of textures and flavors", dish_type: "Desserts")
file = URI.open("https://bing.com/th?id=OSK.8267302d177279b408cc1a9d9613d616")
product11.photo.attach(io: file, filename: "11.jpg", content_type: "image/jpg")
product11.restaurant = restaurant
product11.save

product12 = Product.new(name: "Banana Chocolate Chip Muffins", price: 10.00, description: "Banana chocolate chip muffins are a fantastic way to use up ripe bananas and enjoy a sweet treat.", dish_type: "Desserts")
file = URI.open("https://bing.com/th?id=OSK.089221ea88cb80e2bd93318d4a7cf604")
product12.photo.attach(io: file, filename: "12.jpg", content_type: "image/jpg")
product12.restaurant = restaurant
product12.save


product13 = Product.new(name: "Southern Peach Cobbler", price: 8.00, description: "Sweet and juicy with plenty of real peach flavor and just the right touch of cinnamon, this cobbler is the last homemade peach cobbler", dish_type: "Desserts")
file = URI.open("https://bing.com/th?id=OSK.187951fc01deab3040b433e7af881bc0")
product13.photo.attach(io: file, filename: "13.jpg", content_type: "image/jpg")
product13.restaurant = restaurant
product13.save

puts "Seeds completed"
