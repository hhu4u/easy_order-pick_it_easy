# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database"
Review.destroy_all
Basket.destroy_all
Order.destroy_all
Table.destroy_all
Order.destroy_all
Product.destroy_all
Restaurant.destroy_all
User.destroy_all

puts "Creating users"
owner1 = User.new(first_name: "John", last_name: "Doe", email: "johndoe@mail.com", password: "123456")
# file = URI.open("https://th.bing.com/th/id/OIP.SDb1v0SzPPmCDIUv5LvdPQAAAA?pid=ImgDet&rs=1")
file = URI.open("https://images.pexels.com/photos/1267335/pexels-photo-1267335.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
owner1.photo.attach(io: file, filename: "owner1.jpg", content_type: "image/jpg")
owner1.save

customer1 = User.new(first_name: "David", last_name: "Smith", email: "davidsmith@mail.com", password: "123456")
file = URI.open("https://images.pexels.com/photos/2269872/pexels-photo-2269872.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
customer1.photo.attach(io: file, filename: "owner2.jpg", content_type: "image/jpg")
customer1.save

owner2 = User.new(first_name: "Julie", last_name: "Smith", email: "juliesmith@mail.com", password: "123456")
# file = URI.open("https://stagea.blob.core.windows.net/images/photos/paulena-sharp-175d/paulena-sharp-ufl0s1sl.2fa.jpg")
file = URI.open("https://images.pexels.com/photos/3021538/pexels-photo-3021538.jpeg?auto=compress&cs=tinysrgb&w=1600")
owner2.photo.attach(io: file, filename: "customer1.jpg", content_type: "image/jpg")
owner2.save

puts "Creating owner1 restaurant"
restaurant1 = Restaurant.new(name: "The Wagoner", address: "Rue de Flandre 95, 1000 Bruxelles")
restaurant1.user = owner1
file = URI.open("https://www.royalfestival.be/wp-content/uploads/elementor/thumbs/Royal-Festival-de-Spa-2022-Dimanche-14-aout-31-q6lk609kkw7ivipjdobfafwdncq7oqw864m65uqun4.jpg")
restaurant1.photo.attach(io: file, filename: "terasse.jpg", content_type: "image/jpg")
restaurant1.save

puts "Creating owner2 restaurant"
restaurant2 = Restaurant.new(name: "Sunset Beach Bar", address: "Aloha Beach, Bali")
restaurant2.user = owner2
# file = URI.open("https://www.royalfestival.be/wp-content/uploads/elementor/thumbs/Royal-Festival-de-Spa-2022-Dimanche-14-aout-31-q6lk609kkw7ivipjdobfafwdncq7oqw864m65uqun4.jpg")
# file = URI.open("https://parissecret.com/wp-content/uploads/2021/05/COUV-ARTICLES-1920x1080-2022-07-25T120759.602-96x73.jpg")
file = URI.open("https://www.splendidmykonos.com/wp-content/uploads/2017/05/Nammos-4.jpg")
restaurant2.photo.attach(io: file, filename: "terasse.jpg", content_type: "image/jpg")
restaurant2.save

puts "Creating owner1 restaurant tables"
i = 1
25.times do
  table = Table.new(number: i)
  table.restaurant = restaurant1
  table.save
  qr = RQRCode::QRCode.new("https://www.pickiteasy.me/restaurants/#{restaurant1.id}/?table=#{table.id}&basket=new")
  @svg = qr.as_svg(
    offset: 0,
    module_size: 7,
    color: '000',
    shape_rendering: 'crispEdges',
    standalone: true
  )
  table.qr_code = @svg
  table.save
  i += 1
end

puts "Creating owner2 restaurant tables"
i = 1
34.times do
  table = Table.new(number: i)
  table.restaurant = restaurant2
  table.save
  qr = RQRCode::QRCode.new("https://www.pickiteasy.me/restaurants/#{restaurant2.id}/?table=#{table.id}&basket=new")
  @svg = qr.as_svg(
    offset: 0,
    module_size: 7,
    color: '000',
    shape_rendering: 'crispEdges',
    standalone: true
  )
  table.qr_code = @svg
  table.save
  i += 1
end

puts "Creating owner1 restaurant products"
product = Product.new(name: "Hamburger Classico",
price: 15.00,
ingredients: "Ground beef, Buns, Salt, Pepper, Tomato, Onion, Cheese, Ketchup, Mustard, Mayonnaise, Bacon, mushrooms, egg",
description: "A succulent beef patty, seared to perfection and crowned with melted cheese, nestled within a toasted brioche bun, harmonizing savory and creamy flavors in every bite.",
dish_type: "Main Courses")
# file = URI.open("https://www.thecookierookie.com/wp-content/uploads/2023/04/featured-stovetop-burgers-recipe.jpg")
# file = URI.open("https://wallpapercave.com/wp/wp1987065.jpg")
# file = URI.open("https://images.unsplash.com/photo-1550547660-d9450f859349?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1965&q=80.jpg")
local_main_image_path = Rails.root.join('app','assets','images','burger.jpg')
local_thumb_image_path = Rails.root.join('app','assets','images','burgerth.jpg')
main = File.open(local_main_image_path)
thumb = File.open(local_thumb_image_path)
product.photo.attach(io: main, filename: "1.jpg", content_type: "image/jpg")
product.thumbnail.attach(io: thumb, filename: "1th.jpg", content_type: "image/jpg")
product.restaurant = restaurant1
product.save

product = Product.new(name: "Italian Lasagna",
                       price: 18.00,
                       ingredients: "Ground beef, Onion, Garlic cloves, minced, Tomatoes, Olive oil, Dried oregano, Dried basil, Bay leaves",
                       description: "Crispy and golden on the outside and juicy in the middle, so delicious.",
                       dish_type: "Main Courses")
# file = URI.open("https://www.finedininglovers.com/sites/g/files/xknfdk626/files/styles/recipes_1200_800/public/2022-11/THE_SECRET_OF_ITALIAN_FOOD_LASAGNA_00.jpeg.webp?itok=VELk23pO")
file = URI.open("https://carlocao.com/wp-content/uploads/2022/06/CAR1034.jpg")
product.photo.attach(io: file, filename: "2.jpg", content_type: "image/jpg")
product.restaurant = restaurant1
product.save


product = Product.new(name: "Pasta Bolognese",
                       price: 15.00,
                       ingredients: "Ground beef, Onion, Carrot, Celery, Pancetta or bacon, finely, Garlic cloves, tomatoes, Whole milk, wine, Bay leaves",
                       description: "This dish can be more representative of the Bolognese tradition with tagliatelle",
                       dish_type: "Main Courses")
file = URI.open("https://www.finedininglovers.com/sites/g/files/xknfdk626/files/styles/recipes_1200_800/public/2021-03/ragu_bolognese.jpg.webp?itok=ZGXPM0Lv")
product.photo.attach(io: file, filename: "3.jpg", content_type: "image/jpg")
product.restaurant = restaurant1
product.save

product = Product.new(name: "Shepherd's Pie",
                       price: 17.00,
                       ingredients: "Beef, Onion, Carrots, Peas, Garlic cloves, Tomato, Worcestershire sauce, Olive oil, potatoes",
                       description: "Delicious Shepherd's Pie topped with crispy potatoes",
                       dish_type: "Main Courses")
file = URI.open("https://www.finedininglovers.com/sites/g/files/xknfdk626/files/styles/recipes_1200_800/public/Original_18258_gluten-free-shepherd-pie.jpg.webp?itok=rL9XN1cu")
product.photo.attach(io: file, filename: "4.jpg", content_type: "image/jpg")
product.restaurant = restaurant1
product.save

product = Product.new(name: "Tofu Laksa",
                       price: 17.00,
                       ingredients: "Shallots, garlic, peppers, lemongrass, ginger, firm tofu, rice noodles, assorted vegetables",
                       description: "delicious tofu laksa, a vegetarian version of the Malaysian-spiced soup served with noodles.",
                       dish_type: "Main Courses")
file = URI.open("https://www.finedininglovers.com/sites/g/files/xknfdk626/files/styles/recipes_1200_800/public/Original_18221_vegetarian-laska-tofu-noodles-dairy-free.jpg.webp?itok=xuTT-krL")
product.photo.attach(io: file, filename: "5.jpg", content_type: "image/jpg")
product.restaurant = restaurant1
product.save

product = Product.new(name: "Garlic Shrimp",
                       price: 12.00,
                       ingredients: "Shrimp, butter, lemon juice, garlic",
                       description: "Succulent shrimp sautéed to perfection in a delightful garlic sauce, providing a burst of rich and savory flavors. A must-try option for seafood enthusiasts.",
                       dish_type: "Starters")
local_main_image_path = Rails.root.join('app','assets','images','scampis.jpg')
local_thumb_image_path = Rails.root.join('app','assets','images','scampisth.jpg')
main = File.open(local_main_image_path)
thumb = File.open(local_thumb_image_path)
product.photo.attach(io: main, filename: "coca.jpg", content_type: "image/jpg")
product.thumbnail.attach(io: thumb, filename: "cocath.jpg", content_type: "image/jpg")
product.restaurant = restaurant1
product.save


product = Product.new(name: "Caprese Skewers",
                       price: 10.00,
                       ingredients: "Fresh mozzarella cheese, Cherry tomatoes, basil leaves, olive oil, Salt and pepper",
                       description: "These colorful caprese salad skewers with bite-sized portions are perfect for holiday parties",
                       dish_type: "Starters")
# file = URI.open("https://thumbs.dreamstime.com/b/fresh-tomato-mozzarella-balls-basil-platter-plate-toothpicks-55833406.jpg")
# file = URI.open("https://i.pinimg.com/564x/d9/73/e7/d973e70090456dc9bbbf27f58a83ef3e.jpg")
file = URI.open("https://th.bing.com/th/id/R.891ad3e165e86418da6b02cf11a2b28f?rik=JsMDriL4QQKjzg&riu=http%3a%2f%2fwww.cookincanuck.com%2fwp-content%2fuploads%2f2016%2f06%2fCapresePotatoSkewersFinal.jpg&ehk=GE6XaVZBjqWRSewSeJl%2bZvSWMMEdmo4MF9JxoLXOy7Q%3d&risl=&pid=ImgRaw&r=0")
product.photo.attach(io: file, filename: "7.jpg", content_type: "image/jpg")
product.restaurant = restaurant1
product.save


product = Product.new(name: "Spring Rolls",
                       price: 8.00,
                       ingredients: "Cabbage, carrot, bean sprouts, glass noodles, green onions, mushrooms, garlic, soy sauce",
                       description: "Delight in these crispy spring rolls filled with a medley of vegetables and vermicelli noodles",
                       dish_type: "Starters")
file = URI.open("https://bing.com/th?id=OSK.589ddc5f292c25bc3eca86dddab837f1")
product.photo.attach(io: file, filename: "8.jpg", content_type: "image/jpg")
product.restaurant = restaurant1
product.save

product = Product.new(name: "Satay Skewers",
                       price: 8.00,
                       ingredients: " Chicken, soy sauce, fish sauce, brown sugar, cumin, garlic, ginger, Pepper,  Peanut Sauce",
                       description: "Embark with these tender chicken skewers marinated in fragrant spices and served with a rich peanut sauce.",
                       dish_type: "Starters")
file = URI.open("https://www.currytrail.in/wp-content/uploads/2016/08/IMG_5188-720x720.jpg")
product.photo.attach(io: file, filename: "9.jpg", content_type: "image/jpg")
product.restaurant = restaurant1
product.save

product = Product.new(name: "Tiramisu",
                        price: 10.00,
                        ingredients: "Coffee Soaking Syrup, Mascarpone, Ladyfinger cookies",
                        description: "Tiramisu is a sophisticated dessert with layers of coffee-soaked ladyfingers.",
                        dish_type: "Desserts")
file = URI.open("https://th.bing.com/th/id/R.743fbf4cf71f1f43020e981be7e03121?rik=t46AyC8d5qxl4Q&pid=ImgRaw&r=0")
product.photo.attach(io: file, filename: "10.jpg", content_type: "image/jpg")
product.restaurant = restaurant1
product.save

product = Product.new(name: "Fruit Parfait",
                        price: 12.00,
                        ingredients: "Fresh mixed fruits, Yogurt, cerel, maple syrup, Nuts, Fresh mint leaves",
                        description: "A fruit parfait is a refreshing and healthier dessert option. The layers provide a satisfying mix of textures and flavors",
                        dish_type: "Desserts")
file = URI.open("https://www.veggieinspired.com/wp-content/uploads/2016/03/coconut-chia-seed-granola-hero-1024x1536.jpg")
product.photo.attach(io: file, filename: "11.jpg", content_type: "image/jpg")
product.restaurant = restaurant1
product.save

product = Product.new(name: "Banana Chocolate Chip Muffins",
                        price: 10.00,
                        ingredients: " Bananas, eggs, unsalted butter, chocolate chips, chopped nuts",
                        description: "Banana chocolate chip muffins are a fantastic way to use up ripe bananas and enjoy a sweet treat.",
                        dish_type: "Desserts")
file = URI.open("https://bing.com/th?id=OSK.089221ea88cb80e2bd93318d4a7cf604")
product.photo.attach(io: file, filename: "12.jpg", content_type: "image/jpg")
product.restaurant = restaurant1
product.save


product = Product.new(name: "Peach Cobbler",
                        price: 8.00,
                        ingredients: " Fresh peaches, granulated sugar, unsalted butter, lemon juice, cinnamn, nutmeg",
                        description: "Sweet and juicy with plenty of real peach flavor and just the right touch of cinnamon.",
                        dish_type: "Desserts")
file = URI.open("https://i.pinimg.com/originals/58/f9/6f/58f96fc9c3e5bd4de8a079e88614f750.jpg")
product.photo.attach(io: file, filename: "13.jpg", content_type: "image/jpg")
product.restaurant = restaurant1
product.save

product = Product.new(name: "Red wine",
                        price: 8.00,
                        dish_type: "Wines")
file = URI.open("https://img.buzzfeed.com/buzzfeed-static/static/2017-06/26/10/asset/buzzfeed-prod-fastlane-01/sub-buzz-28795-1498486984-1.jpg")
product.photo.attach(io: file, filename: "14.jpg", content_type: "image/jpg")
product.restaurant = restaurant1
product.save

product = Product.new(name: "White wine",
  price: 8.00,
  dish_type: "Wines")
file = URI.open("https://th.bing.com/th/id/OIP.txs-yHf96Gp8vuK0wFFGugAAAA?pid=ImgDet&rs=1")
product.photo.attach(io: file, filename: "15.jpg", content_type: "image/jpg")
product.restaurant = restaurant1
product.save

product = Product.new(name: "Rose wine",
  price: 8.00,
   dish_type: "Wines")
file = URI.open("https://img.freepik.com/free-photo/rose-wine-different-glasses-gray-concrete-background-minimal-wine-still-life-composition_221542-1863.jpg?w=2000")
product.photo.attach(io: file, filename: "16.jpg", content_type: "image/jpg")
product.restaurant = restaurant1
product.save

product = Product.new(name: "Tonic Water",
  price: 5.00,
   dish_type: "Soft drinks")
file = URI.open("https://i.pinimg.com/736x/62/c8/2f/62c82f7b98a0235af9fe79f70dd59aee.jpg")
product.photo.attach(io: file, filename: "22.jpg", content_type: "image/jpg")
product.restaurant = restaurant1
product.save

product = Product.new(name: "Dr Pepper",
  price: 12.00,
   dish_type: "Soft drinks")
file = URI.open("https://fastfoodnutrition.org/item-photos/768x640/8633_s.jpg")
product.photo.attach(io: file, filename: "24.jpg", content_type: "image/jpg")
product.restaurant = restaurant1
product.save

product = Product.new(name: "Ginger Ale",
  price: 12.00,
   dish_type: "Soft drinks")
file = URI.open("https://www.1001cocktails.com/wp-content/uploads/1001cocktails/2023/03/85006_origin-scaled.jpg")
product.photo.attach(io: file, filename: "25.jpg", content_type: "image/jpg")
product.restaurant = restaurant1
product.save

product = Product.new(name: "Steak Frites",
                       price: 22.00,
                       ingredients: "Flank Steak, french fries, mayonnaise, assorted vegetables",
                       description: "Grilled Herb-Crusted Steak served with perfectly crispy hand-cut fries, a symphony of flavors and textures that will tantalize your taste buds. Elevate your dining experience with this classic dish, artfully crafted with a touch of elegance.",
                       dish_type: "Main Courses")
file = URI.open("https://www.piedmontese.com/Content/Images/_Piedmontese/RecipePhotos/0-Steak-Frites.jpg")
product.photo.attach(io: file, filename: "26.jpg", content_type: "image/jpg")
product.restaurant = restaurant1
product.save

product = Product.new(name: "Coca-Cola",
price: 4.00,
description: "A timeless, fizzy delight with a sweet and satisfying taste that pairs perfectly with any meal.",
dish_type: "Soft drinks")
local_main_image_path = Rails.root.join('app','assets','images','coca.jpg')
local_thumb_image_path = Rails.root.join('app','assets','images','coca.jpg')
main = File.open(local_main_image_path)
thumb = File.open(local_thumb_image_path)
product.photo.attach(io: main, filename: "coca.jpg", content_type: "image/jpg")
product.thumbnail.attach(io: thumb, filename: "cocath.jpg", content_type: "image/jpg")
product.restaurant = restaurant1
product.save

product = Product.new(name: "Sprite",
price: 4.00,
description: "A crisp and zesty lemon-lime soda that provides a burst of refreshing citrus flavor to accompany your dining experience.",
dish_type: "Soft drinks")
local_main_image_path = Rails.root.join('app','assets','images','sprite.jpg')
local_thumb_image_path = Rails.root.join('app','assets','images','spriteth.jpg')
main = File.open(local_main_image_path)
thumb = File.open(local_thumb_image_path)
product.photo.attach(io: main, filename: "coca.jpg", content_type: "image/jpg")
product.thumbnail.attach(io: thumb, filename: "cocath.jpg", content_type: "image/jpg")
product.restaurant = restaurant1
product.save

product = Product.new(name: "Orangina",
price: 4.00,
description: "A sparkling blend of real orange juice with a hint of zesty citrus pulp, offering a tangy and invigorating thirst-quencher.",
dish_type: "Soft drinks")
local_main_image_path = Rails.root.join('app','assets','images','orangina.jpg')
local_thumb_image_path = Rails.root.join('app','assets','images','oranginath.jpg')
main = File.open(local_main_image_path)
thumb = File.open(local_thumb_image_path)
product.photo.attach(io: main, filename: "coca.jpg", content_type: "image/jpg")
product.thumbnail.attach(io: thumb, filename: "cocath.jpg", content_type: "image/jpg")
product.restaurant = restaurant1
product.save

product = Product.new(name: "Mojito",
  price: 10.00,
  ingredients: "White rum, fresh mint leaves, lime juice, simple syrup, soda water, and plenty of ice.",
   dish_type: "Cocktails")
# file = URI.open("https://th.bing.com/th/id/R.b61e87af03c84452e4aeaa38b65a2f89?rik=pmpvRnJhh0svDA&pid=ImgRaw&r=0")
local_main_image_path = Rails.root.join('app','assets','images','mojito.jpg')
local_thumb_image_path = Rails.root.join('app','assets','images','mojitoth.jpg')
main = File.open(local_main_image_path)
thumb = File.open(local_thumb_image_path)
product.photo.attach(io: main, filename: "20.jpg", content_type: "image/jpg")
product.thumbnail.attach(io: thumb, filename: "20th.jpg", content_type: "image/jpg")
product.restaurant = restaurant1
product.save

# ------------------------------------------------------------------------------------





puts "Creating owner2 restaurant products"

product = Product.new(name: "Coca-Cola",
price: 4.00,
description: "A timeless, fizzy delight with a sweet and satisfying taste that pairs perfectly with any meal.",
dish_type: "Soft drinks")
# file = URI.open("https://www.thecookierookie.com/wp-content/uploads/2023/04/featured-stovetop-burgers-recipe.jpg")
# file = URI.open("https://wallpapercave.com/wp/wp1987065.jpg")
# file = URI.open("https://images.unsplash.com/photo-1550547660-d9450f859349?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1965&q=80.jpg")
local_main_image_path = Rails.root.join('app','assets','images','coca.jpg')
local_thumb_image_path = Rails.root.join('app','assets','images','coca.jpg')
main = File.open(local_main_image_path)
thumb = File.open(local_thumb_image_path)
product.photo.attach(io: main, filename: "coca.jpg", content_type: "image/jpg")
product.thumbnail.attach(io: thumb, filename: "cocath.jpg", content_type: "image/jpg")
product.restaurant = restaurant2
product.save

product = Product.new(name: "Still Water",
price: 7.00,
description: "Refresh and hydrate with our crisp, pure bottled water. A simple, thirst-quenching choice to complement your dining experience.",
dish_type: "Soft drinks")
local_main_image_path = Rails.root.join('app','assets','images','water.jpg')
local_thumb_image_path = Rails.root.join('app','assets','images','waterth.jpg')
main = File.open(local_main_image_path)
thumb = File.open(local_thumb_image_path)
product.photo.attach(io: main, filename: "coca.jpg", content_type: "image/jpg")
product.thumbnail.attach(io: thumb, filename: "cocath.jpg", content_type: "image/jpg")
product.restaurant = restaurant2
product.save

product = Product.new(name: "Tonic Water",
  price: 5.00,
   dish_type: "Soft drinks")
file = URI.open("https://i.pinimg.com/736x/62/c8/2f/62c82f7b98a0235af9fe79f70dd59aee.jpg")
product.photo.attach(io: file, filename: "22.jpg", content_type: "image/jpg")
product.restaurant = restaurant2
product.save

product = Product.new(name: "Sprite",
price: 4.00,
description: "A crisp and zesty lemon-lime soda that provides a burst of refreshing citrus flavor to accompany your dining experience.",
dish_type: "Soft drinks")
local_main_image_path = Rails.root.join('app','assets','images','sprite.jpg')
local_thumb_image_path = Rails.root.join('app','assets','images','spriteth.jpg')
main = File.open(local_main_image_path)
thumb = File.open(local_thumb_image_path)
product.photo.attach(io: main, filename: "coca.jpg", content_type: "image/jpg")
product.thumbnail.attach(io: thumb, filename: "cocath.jpg", content_type: "image/jpg")
product.restaurant = restaurant2
product.save

product = Product.new(name: "Orangina",
price: 4.00,
description: "A sparkling blend of real orange juice with a hint of zesty citrus pulp, offering a tangy and invigorating thirst-quencher.",
dish_type: "Soft drinks")
local_main_image_path = Rails.root.join('app','assets','images','orangina.jpg')
local_thumb_image_path = Rails.root.join('app','assets','images','oranginath.jpg')
main = File.open(local_main_image_path)
thumb = File.open(local_thumb_image_path)
product.photo.attach(io: main, filename: "coca.jpg", content_type: "image/jpg")
product.thumbnail.attach(io: thumb, filename: "cocath.jpg", content_type: "image/jpg")
product.restaurant = restaurant2
product.save

product = Product.new(name: "Margarita",
  price: 9.00,
  ingredients: "Tequila, lime juice, orange liqueur (such as triple sec or Cointreau), and optionally, a salted rim.",
  dish_type: "Cocktails")
# file = URI.open("https://delicerecipes.com/wp-content/uploads/2021/01/Frozen-Margarita-Cocktail.jpg")
local_main_image_path = Rails.root.join('app','assets','images','6.jpg')
local_thumb_image_path = Rails.root.join('app','assets','images','6th.jpg')
main = File.open(local_main_image_path)
thumb = File.open(local_thumb_image_path)
product.photo.attach(io: main, filename: "17.jpg", content_type: "image/jpg")
product.thumbnail.attach(io: thumb, filename: "17th.jpg", content_type: "image/jpg")
product.restaurant = restaurant2
product.save

product = Product.new(name: "Martini",
  price: 12.00,
  ingredients: "Vodka, vermouth, and sometimes garnished with an olive or lemon twist.",
  dish_type: "Cocktails")
# file = URI.open("https://th.bing.com/th/id/OIP.9cRJxikcOOmYhn_bi9fdiwHaLF?pid=ImgDet&rs=1")
local_main_image_path = Rails.root.join('app','assets','images','5.jpg')
local_thumb_image_path = Rails.root.join('app','assets','images','5th.jpg')
main = File.open(local_main_image_path)
thumb = File.open(local_thumb_image_path)
product.photo.attach(io: main, filename: "18.jpg", content_type: "image/jpg")
product.thumbnail.attach(io: thumb, filename: "18th.jpg", content_type: "image/jpg")
product.restaurant = restaurant2
product.save

product = Product.new(name: "Moscow Mule",
  price: 9.00,
  ingredients: "Vodka, ginger beer, and lime juice, often garnished with a lime wedge.",
   dish_type: "Cocktails")
# file = URI.open("https://i.pinimg.com/originals/6c/53/78/6c5378104581dec54026d13e703c3dad.jpg")
local_main_image_path = Rails.root.join('app','assets','images','7.jpg')
local_thumb_image_path = Rails.root.join('app','assets','images','7th.jpg')
main = File.open(local_main_image_path)
thumb = File.open(local_thumb_image_path)
product.photo.attach(io: main, filename: "19.jpg", content_type: "image/jpg")
product.thumbnail.attach(io: thumb, filename: "19th.jpg", content_type: "image/jpg")
product.restaurant = restaurant2
product.save

product = Product.new(name: "Mojito",
  price: 10.00,
  ingredients: "White rum, fresh mint leaves, lime juice, simple syrup, soda water, and plenty of ice.",
   dish_type: "Cocktails")
# file = URI.open("https://th.bing.com/th/id/R.b61e87af03c84452e4aeaa38b65a2f89?rik=pmpvRnJhh0svDA&pid=ImgRaw&r=0")
local_main_image_path = Rails.root.join('app','assets','images','mojito.jpg')
local_thumb_image_path = Rails.root.join('app','assets','images','mojitoth.jpg')
main = File.open(local_main_image_path)
thumb = File.open(local_thumb_image_path)
product.photo.attach(io: main, filename: "20.jpg", content_type: "image/jpg")
product.thumbnail.attach(io: thumb, filename: "20th.jpg", content_type: "image/jpg")
product.restaurant = restaurant2
product.save

product = Product.new(name: "Cosmopolitan",
  price: 12.00,
  ingredients: "Vodka, cranberry juice, orange liqueur, and freshly squeezed lime juice.",
   dish_type: "Cocktails")
# file = URI.open("https://i.pinimg.com/originals/ec/69/32/ec69320a94b481e7650f7ff71d77ffc5.jpg")
local_main_image_path = Rails.root.join('app','assets','images','2.jpg')
local_thumb_image_path = Rails.root.join('app','assets','images','2th.jpg')
main = File.open(local_main_image_path)
thumb = File.open(local_thumb_image_path)
product.photo.attach(io: main, filename: "21.jpg", content_type: "image/jpg")
product.thumbnail.attach(io: thumb, filename: "21th.jpg", content_type: "image/jpg")
product.restaurant = restaurant2
product.save

puts "Creating owner1 basket"
basket1 = Basket.new
basket1.table = owner2.restaurants.first.tables.first
basket1.basket_status = "New"
basket1.user = owner1
basket1.save

puts "Creating owner2 basket"
basket2 = Basket.new
basket2.table = owner1.restaurants.first.tables.first
basket2.basket_status = "New"
basket2.user = owner2
basket2.save

puts "Creating customer's basket"
basket3 = Basket.new
basket3.table = owner2.restaurants.first.tables.first
basket3.basket_status = "New"
basket3.user = customer1
basket3.save

# puts "Updating reviews"
# products = Product.all
# products.each do |product|
#   product.reviews.rating = rand(4..5)
#   product.save
# end

puts "Seeds completed"
