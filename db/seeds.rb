# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

categories = ["Magic 8 ball", "Crystal ball", "Hand reading", "Tarot cards", "Tea leaves", "Horoscopes", "Asparagus tossing", "Other"]

if Category.all.length == 0
    categories.each do |category|
        Category.create(name: category)
        puts "created #{category} category"
    end
end

if User.count == 0
    User.create(username: "ash", name: "Ash", email: "ash@ketchum.com", password: "LuvUPikachu", password_confirmation: "LuvUPikachu")
    User.create(username: "brock", name: "Brock", email: "brock@harrison.com", password: "LuvUOnix", password_confirmation: "LuvUOnix")
end

if Prediction.all.length == 0
    Prediction.create(user_id: 1, category_id: 1, description: "If you jump over six blades of grass, and then walk backwards to work, you will find a banana on your desk.")
    Prediction.create(user_id: 1, category_id: 2, description: "Beware of the chicken in the back of your fridge.")
    Prediction.create(user_id: 1, category_id: 3, description: "You thre 3 asparagus, which means you'll have 4 dogs.")
    Prediction.create(user_id: 1, category_id: 4, description: "There will be four day working week!")
    Prediction.create(user_id: 2, category_id: 5, description: "There is a star in your cup, this is a great sign.")
    Prediction.create(user_id: 2, category_id: 6, description: "There is a guinea pig in your near future.")
    Prediction.create(user_id: 2, category_id: 7, description: "Impossible to tell.")
    Prediction.create(user_id: 2, category_id: 8, description: "You will earn a small fortune of dust particles today.")
    Prediction.create(user_id: 2, category_id: 1, description: "Uncertain?")
end