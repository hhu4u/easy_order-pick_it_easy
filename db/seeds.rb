# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database"
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
restaurant1 = Restaurant.new(name: "Selecto", address: "Rue de Flandre 95, 1000 Bruxelles")
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
  qr = RQRCode::QRCode.new("https://www.pickiteasy.me/restaurants/#{restaurant1.id}/?table=#{table.id}")
  @svg = qr.as_svg(
    offset: 0,
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
25.times do
  table = Table.new(number: i)
  table.restaurant = restaurant2
  table.save
  qr = RQRCode::QRCode.new("https://www.pickiteasy.me/restaurants/#{restaurant2.id}/?table=#{table.id}")
  @svg = qr.as_svg(
    offset: 0,
    color: '000',
    shape_rendering: 'crispEdges',
    standalone: true
  )
  table.qr_code = @svg
  table.save
  i += 1
end

puts "Creating owner1 restaurant products"
product1 = Product.new(name: "Hamburger Classico",
price: 15.00,
ingredients: "Ground beef, Buns, Salt, Pepper, Tomato, Onion, Cheese, Ketchup, Mustard, Mayonnaise, Bacon, mushrooms, egg",
description: "A succulent beef patty, seared to perfection and crowned with melted cheese, nestled within a toasted brioche bun, harmonizing savory and creamy flavors in every bite.",
dish_type: "Main Courses")
# file = URI.open("https://www.thecookierookie.com/wp-content/uploads/2023/04/featured-stovetop-burgers-recipe.jpg")
# file = URI.open("https://wallpapercave.com/wp/wp1987065.jpg")
# file = URI.open("https://images.unsplash.com/photo-1550547660-d9450f859349?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1965&q=80.jpg")
file = URI.open("https://resize-elle.ladmedia.fr/rcrop/638,,forcex/img/var/plain_site/storage/images/elle-a-table/les-dossiers-de-la-redaction/dossier-de-la-redac/hamburger-maison/94060670-1-fre-FR/Comment-preparer-le-meilleur-hamburger-maison-du-monde.jpg")
product1.photo.attach(io: file, filename: "1.jpg", content_type: "image/jpg")
product1.restaurant = restaurant1
product1.save

product2 = Product.new(name: "Italian Lasagna",
                       price: 18.00,
                       ingredients: "Ground beef, Onion, Garlic cloves, minced, Tomatoes, Olive oil, Dried oregano, Dried basil, Bay leaves",
                       description: "Crispy and golden on the outside and juicy in the middle, so delicious.",
                       dish_type: "Main Courses")
# file = URI.open("https://www.finedininglovers.com/sites/g/files/xknfdk626/files/styles/recipes_1200_800/public/2022-11/THE_SECRET_OF_ITALIAN_FOOD_LASAGNA_00.jpeg.webp?itok=VELk23pO")
file = URI.open("https://carlocao.com/wp-content/uploads/2022/06/CAR1034.jpg")
product2.photo.attach(io: file, filename: "2.jpg", content_type: "image/jpg")
product2.restaurant = restaurant1
product2.save


product3 = Product.new(name: "Ragù Bolognese",
                       price: 15.00,
                       ingredients: "Ground beef, Onion, Carrot, Celery, Pancetta or bacon, finely, Garlic cloves, tomatoes, Whole milk, wine, Bay leaves",
                       description: "This dish can be more representative of the Bolognese tradition with tagliatelle",
                       dish_type: "Main Courses")
file = URI.open("https://www.finedininglovers.com/sites/g/files/xknfdk626/files/styles/recipes_1200_800/public/2021-03/ragu_bolognese.jpg.webp?itok=ZGXPM0Lv")
product3.photo.attach(io: file, filename: "3.jpg", content_type: "image/jpg")
product3.restaurant = restaurant1
product3.save

product4 = Product.new(name: "Shepherd's Pie",
                       price: 17.00,
                       ingredients: "beef, Onion, Carrots, Peas, Garlic cloves, Tomato, Worcestershire sauce, Olive oil, potatoes",
                       description: "Delicious Shepherd's Pie topped with crispy potatoes",
                       dish_type: "Main Courses")
file = URI.open("https://www.finedininglovers.com/sites/g/files/xknfdk626/files/styles/recipes_1200_800/public/Original_18258_gluten-free-shepherd-pie.jpg.webp?itok=rL9XN1cu")
product4.photo.attach(io: file, filename: "4.jpg", content_type: "image/jpg")
product4.restaurant = restaurant1
product4.save

product5 = Product.new(name: "Tofu Laksa",
                       price: 17.00,
                       ingredients: "shallots, garlic, peppers, lemongrass, ginger, firm tofu, rice noodles, assorted vegetables",
                       description: "delicious tofu laksa, a vegetarian version of the Malaysian-spiced soup served with noodles.",
                       dish_type: "Main Courses")
file = URI.open("https://www.finedininglovers.com/sites/g/files/xknfdk626/files/styles/recipes_1200_800/public/Original_18221_vegetarian-laska-tofu-noodles-dairy-free.jpg.webp?itok=xuTT-krL")
product5.photo.attach(io: file, filename: "5.jpg", content_type: "image/jpg")
product5.restaurant = restaurant1
product5.save

product6 = Product.new(name: "Calamari with Aioli",
                       price: 12.00,
                       ingredients: " calamari, paprika, mayonnaise, lemon juice, garlic",
                       description: "The perfect balance of textures and flavors makes this a classic starter.",
                       dish_type: "Starters")
file = URI.open("https://bing.com/th?id=OSK.62dffd3fe5ce4731030d9858ccf7bd5a")
product6.photo.attach(io: file, filename: "6.jpg", content_type: "image/jpg")
product6.restaurant = restaurant1
product6.save


product7 = Product.new(name: "Caprese Skewers",
                       price: 10.00,
                       ingredients: "Fresh mozzarella cheese, Cherry tomatoes, basil leaves, olive oil, Salt and pepper",
                       description: "These colorful caprese salad skewers with bite-sized portions are perfect for holiday parties",
                       dish_type: "Starters")
# file = URI.open("https://thumbs.dreamstime.com/b/fresh-tomato-mozzarella-balls-basil-platter-plate-toothpicks-55833406.jpg")
file = URI.open("https://i.pinimg.com/564x/d9/73/e7/d973e70090456dc9bbbf27f58a83ef3e.jpg")
product7.photo.attach(io: file, filename: "7.jpg", content_type: "image/jpg")
product7.restaurant = restaurant1
product7.save


product8 = Product.new(name: "Spring Rolls",
                       price: 8.00,
                       ingredients: "cabbage, carrot, bean sprouts, glass noodles, green onions, mushrooms, garlic, soy sauce",
                       description: "Delight in these crispy spring rolls filled with a medley of vegetables and vermicelli noodles",
                       dish_type: "Starters")
file = URI.open("https://www.tasteofhome.com/wp-content/uploads/2018/01/Easy-Egg-Rolls_EXPS_FT21_13235_F_1029_1.jpg?fit=700,1024")
product8.photo.attach(io: file, filename: "8.jpg", content_type: "image/jpg")
product8.restaurant = restaurant1
product8.save

product9 = Product.new(name: "Satay Skewers",
                       price: 8.00,
                       ingredients: " chicken, soy sauce, fish sauce, brown sugar, cumin, garlic, ginger, Pepper,  Peanut Sauce",
                       description: "Embark with these tender chicken skewers marinated in fragrant spices and served with a rich peanut sauce.",
                       dish_type: "Starters")
file = URI.open("https://www.aheadofthyme.com/wp-content/uploads/2020/07/satay-chicken-skewers-with-peanut-sauce-8.jpg")
product9.photo.attach(io: file, filename: "9.jpg", content_type: "image/jpg")
product9.restaurant = restaurant1
product9.save

product10 = Product.new(name: "Tiramisu",
                        price: 10.00,
                        ingredients: "Coffee Soaking Syrup, Mascarpone, Ladyfinger cookies",
                        description: "Tiramisu is a sophisticated dessert with layers of coffee-soaked ladyfingers.",
                        dish_type: "Desserts")
file = URI.open("https://th.bing.com/th/id/R.743fbf4cf71f1f43020e981be7e03121?rik=t46AyC8d5qxl4Q&pid=ImgRaw&r=0")
product10.photo.attach(io: file, filename: "10.jpg", content_type: "image/jpg")
product10.restaurant = restaurant1
product10.save

product11 = Product.new(name: "Fruit Parfait",
                        price: 12.00,
                        ingredients: "Fresh mixed fruits, Yogurt, cerel, maple syrup, Nuts, Fresh mint leaves",
                        description: "A fruit parfait is a refreshing and healthier dessert option. The layers provide a satisfying mix of textures and flavors",
                        dish_type: "Desserts")
file = URI.open("https://bing.com/th?id=OSK.8267302d177279b408cc1a9d9613d616")
product11.photo.attach(io: file, filename: "11.jpg", content_type: "image/jpg")
product11.restaurant = restaurant1
product11.save

product12 = Product.new(name: "Banana Chocolate Chip Muffins",
                        price: 10.00,
                        ingredients: " bananas, eggs, unsalted butter, chocolate chips, chopped nuts",
                        description: "Banana chocolate chip muffins are a fantastic way to use up ripe bananas and enjoy a sweet treat.",
                        dish_type: "Desserts")
file = URI.open("https://bing.com/th?id=OSK.089221ea88cb80e2bd93318d4a7cf604")
product12.photo.attach(io: file, filename: "12.jpg", content_type: "image/jpg")
product12.restaurant = restaurant1
product12.save


product13 = Product.new(name: "Peach Cobbler",
                        price: 8.00,
                        ingredients: " fresh peaches, granulated sugar, unsalted butter, lemon juice, cinnamn, nutmeg",
                        description: "Sweet and juicy with plenty of real peach flavor and just the right touch of cinnamon.",
                        dish_type: "Desserts")
file = URI.open("https://bing.com/th?id=OSK.187951fc01deab3040b433e7af881bc0")
product13.photo.attach(io: file, filename: "13.jpg", content_type: "image/jpg")
product13.restaurant = restaurant1
product13.save

product14 = Product.new(name: "red wine",
                        price: 9.00,
                        dish_type: "Wines")
file = URI.open("https://th.bing.com/th/id/R.6362a4d8101bd26a0fc75413d674744b?rik=2E%2fIKOB2yIG%2f6A&riu=http%3a%2f%2fregrounding.files.wordpress.com%2f2011%2f06%2fred_wine.jpg&ehk=2Y9a6StVLW%2bwNqnffiEm0%2bZL9zab9l%2b9g8UG%2bkOPAo0%3d&risl=&pid=ImgRaw&r=0")
product14.photo.attach(io: file, filename: "14.jpg", content_type: "image/jpg")
product14.restaurant = restaurant1
product14.save

product15 = Product.new(name: "White wine",
  price: 8.00,
  dish_type: "Wines")
file = URI.open("https://th.bing.com/th/id/R.c30d1b9735aa0948f8499a7eb35c8d69?rik=G9PbUHpACmp0uA&riu=http%3a%2f%2fkazzit.com%2fcustom%2fdomain_1%2fimage_files%2fsitemgr_whitewinedry2.jpg&ehk=XItoJzw34uvTEMvwlJscSwb9eTxGgayvQsuaikMpJT0%3d&risl=&pid=ImgRaw&r=0")
product15.photo.attach(io: file, filename: "15.jpg", content_type: "image/jpg")
product15.restaurant = restaurant1
product15.save

product16 = Product.new(name: "Rose wine",
  price: 8.00,
   dish_type: "Wines")
file = URI.open("https://th.bing.com/th/id/R.bdeeefc731f1ebca3c4f351346c7ee3f?rik=Lu0TdpjDHvCveg&pid=ImgRaw&r=0")
product16.photo.attach(io: file, filename: "16.jpg", content_type: "image/jpg")
product16.restaurant = restaurant1
product16.save

product22 = Product.new(name: "Tonic Water",
  price: 5.00,
   dish_type: "Soft drinks")
file = URI.open("https://th.bing.com/th/id/R.5dc1d6cb2860b4fffa3ac741e9eeabee?rik=g1hpyOB5fUwXlA&riu=http%3a%2f%2fwww.sakshamimpex.com%2fsaksham2015%2fwp-content%2fuploads%2f2015%2f10%2fFever-Tree_BLACK_Cocktail_Indian-Tonic_RGB.jpg&ehk=jOXbUzaSdc%2fiZFkbIvhL%2bvfBIb2ZVtWOw%2fwRw%2fDxiFc%3d&risl=&pid=ImgRaw&r=0")
product22.photo.attach(io: file, filename: "22.jpg", content_type: "image/jpg")
product22.restaurant = restaurant1
product22.save

product23 = Product.new(name: "Sprite",
  price: 4.00,
   dish_type: "Soft drinks")
file = URI.open("https://www.churchs.com/wp-content/uploads/2020/10/Churchs-Chicken-Sprite-aspect-ratio-4-3.jpg")
product23.photo.attach(io: file, filename: "23.jpg", content_type: "image/jpg")
product23.restaurant = restaurant1
product23.save

product24 = Product.new(name: "Dr Pepper",
  price: 12.00,
   dish_type: "Soft drinks")
file = URI.open("https://th.bing.com/th/id/R.e70ebe79b004b2222ba864017d7056b2?rik=KyiVr3sBtAGzJQ&pid=ImgRaw&r=0")
product24.photo.attach(io: file, filename: "24.jpg", content_type: "image/jpg")
product24.restaurant = restaurant1
product24.save

product25 = Product.new(name: "Ginger Ale",
  price: 12.00,
   dish_type: "Soft drinks")
file = URI.open("https://i1.wp.com/readynutrition.com/wp-content/uploads/2015/01/gingerale.jpg?ssl=1")
product25.photo.attach(io: file, filename: "25.jpg", content_type: "image/jpg")
product25.restaurant = restaurant1
product25.save

product26 = Product.new(name: "Steak Frites",
                       price: 22.00,
                       ingredients: "Flank Steak, french fries, mayonnaise, assorted vegetables",
                       description: "Grilled Herb-Crusted Steak served with perfectly crispy hand-cut fries, a symphony of flavors and textures that will tantalize your taste buds. Elevate your dining experience with this classic dish, artfully crafted with a touch of elegance.",
                       dish_type: "Main Courses")
file = URI.open("https://www.piedmontese.com/Content/Images/_Piedmontese/RecipePhotos/0-Steak-Frites.jpg")
product26.photo.attach(io: file, filename: "26.jpg", content_type: "image/jpg")
product26.restaurant = restaurant1
product26.save

puts "Creating owner2 restaurant products"

product17 = Product.new(name: "Margarita",
  price: 9.00,
  ingredients: "Tequila, lime juice, orange liqueur (such as triple sec or Cointreau), and optionally, a salted rim.",
  dish_type: "Cocktails")
file = URI.open("https://delicerecipes.com/wp-content/uploads/2021/01/Frozen-Margarita-Cocktail.jpg")
product17.photo.attach(io: file, filename: "17.jpg", content_type: "image/jpg")
product17.restaurant = restaurant2
product17.save

product18 = Product.new(name: "Martini",
  price: 12.00,
  ingredients: "Vodka, vermouth, and sometimes garnished with an olive or lemon twist.",
  dish_type: "Cocktails")
file = URI.open("https://th.bing.com/th/id/OIP.9cRJxikcOOmYhn_bi9fdiwHaLF?pid=ImgDet&rs=1")
product18.photo.attach(io: file, filename: "18.jpg", content_type: "image/jpg")
product18.restaurant = restaurant2
product18.save

product19 = Product.new(name: "Moscow Mule",
  price: 9.00,
  ingredients: "Vodka, ginger beer, and lime juice, often garnished with a lime wedge.",
   dish_type: "Cocktails")
file = URI.open("https://i.pinimg.com/originals/6c/53/78/6c5378104581dec54026d13e703c3dad.jpg")
product19.photo.attach(io: file, filename: "19.jpg", content_type: "image/jpg")
product19.restaurant = restaurant2
product19.save

product20 = Product.new(name: "Mojito",
  price: 10.00,
  ingredients: "White rum, fresh mint leaves, lime juice, simple syrup, soda water, and plenty of ice.",
   dish_type: "Cocktails")
file = URI.open("https://th.bing.com/th/id/R.b61e87af03c84452e4aeaa38b65a2f89?rik=pmpvRnJhh0svDA&pid=ImgRaw&r=0")
product20.photo.attach(io: file, filename: "20.jpg", content_type: "image/jpg")
product20.restaurant = restaurant2
product20.save

product21 = Product.new(name: "Cosmopolitan",
  price: 12.00,
  ingredients: "Vodka, cranberry juice, orange liqueur, and freshly squeezed lime juice.",
   dish_type: "Cocktails")
file = URI.open("https://i.pinimg.com/originals/ec/69/32/ec69320a94b481e7650f7ff71d77ffc5.jpg")
product21.photo.attach(io: file, filename: "21.jpg", content_type: "image/jpg")
product21.restaurant = restaurant2
product21.save

puts "Creating owner1 basket"
basket1 = Basket.new
basket1.table = Table.first
basket1.basket_status = "New"
basket1.user = owner1
basket1.save

puts "Creating owner2 basket"
basket2 = Basket.new
basket2.table = Table.first
basket2.basket_status = "New"
basket2.user = owner2
basket2.save

puts "Creating customer's basket"
basket3 = Basket.new
basket3.table = Table.last
basket3.basket_status = "New"
basket3.user = customer1
basket3.save

puts "Seeds completed"
