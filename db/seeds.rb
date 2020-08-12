# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_role(name)
    Role.where(
        name: name
    ).first_or_create!
end

def create_permission(name)
    Permission.where(
        name: name,
        role: Role.where(name: "Super User").first
    ).first_or_create!
end

def create_theme(name, color)
    Theme.where(
        name: name,
        color: color
    ).first_or_create!
end

def create_admin(user_name, first_name, last_name, email, password)
    User.first_or_create(
        user_name: user_name,
        first_name: first_name,
        last_name: last_name,
        email: email,
        password: password,
        password_confirmation: password,
        role: Role.where(name: "Admin").first,
        theme: Theme.where(name: "Default").first
    )
end

def create_payment_mode(name)
    PaymentMode.where(
        name: name
    ).first_or_create!
end

def create_expense_category(name)
    ExpenseCategory.where(
        name: name
    ).first_or_create!
end

puts "create roles"
role0 = create_role("Admin")
role1 = create_role("Developer")
role2 = create_role("Member")
role3 = create_role("Super User")
role4 = create_role("User")

puts "create permissions"
permission0 = create_permission("account_create")
permission1 = create_permission("account_read")
permission2 = create_permission("account_update")
permission3 = create_permission("account_delete")

puts "create themes"
theme0 = create_theme("Default", "#082E5D")
theme1 = create_theme("Ice blue", "#8BCEEB")
theme2 = create_theme("A little dark", "#666666")
theme3 = create_theme("Navy", "#162483")
theme4 = create_theme("Leaf", "#99CC99")
theme5 = create_theme("Amazon", "#15512B")
theme6 = create_theme("Mandarin", "#ED9C14")
theme7 = create_theme("Navel", "#DB6912")
theme8 = create_theme("Brick", "#C9390A")
theme9 = create_theme("Rose", "#DD6F6F")
theme10 = create_theme("Rouge", "#CF2727")

puts "create admins"
admin0 = create_admin("admin", "Admin", "User", "admin@gmail.com", "KtA@3596!@#")

puts "create payment modes"
payment_mode0 = create_payment_mode("Cash")
payment_mode1 = create_payment_mode("Debt")

puts "create expense categories"
expense_category0 = create_expense_category("Salary")
expense_category1 = create_expense_category("Clothing")
expense_category2 = create_expense_category("Food")