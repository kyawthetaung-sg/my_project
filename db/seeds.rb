# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_theme(name, color_code)
    Theme.where(
        name: name,
        color: color_code
    ).first_or_create!
end

def create_user(password, email)
    user = User.new(
        password: password,
        password_confirmation: password,
        email: email,
        theme: Theme.where(name: "Default").first
    )
    user.save!
end


puts "create themes"
theme0 = create_theme("Default", "#082e5d")
theme1 = create_theme("Red", "#f82c17")
theme2 = create_theme("Green", "#04a718")
theme3 = create_theme("Blue", "#0427a7")
theme4 = create_theme("Black", "#01040d")
theme5 = create_theme("Orange", "#b67808")
theme6 = create_theme("Brown", "#6c1b03")
theme7 = create_theme("Pink", "#c408b6")
theme8 = create_theme("Sky Blue", "#04a193")

puts "create users"
user0 = create_user("123123", "kyaw@gmail.com")
user1 = create_user("123123", "kyawthet@gmail.com")
user2 = create_user("123123", "kyawthetaung@gmail.com")