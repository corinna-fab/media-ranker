# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

PIZZA_FILE = Rails.root.join('db', 'seed_data', 'pizzas-seeds.csv')
puts "Loading raw driver data from #{PIZZA_FILE}"

pizza_failures = []
CSV.foreach(PIZZA_FILE, :headers => true) do |row|
  pizza = Pizza.new
  pizza.id = row['id']
  pizza.name = row['name']
  pizza.crust = row['crust']
  pizza.sauce = row['sauce']
  pizza.cheese = row['cheese']
  pizza.toppings = row['toppings']
  successful = pizza.save
  if !successful
    pizza_failures << pizzza
    puts "Failed to save pizza: #{pizza.inspect}"
  else
    puts "Created driver: #{pizza.inspect}"
  end
end

puts "Added #{Pizza.count} pizza records"
puts "#{pizza_failures.length} pizzas failed to save"

users = [
  {
    name: "catrillionaire"
  },
  {
    name: "bigbaby"
  },
  {
    name: "passwordistaco"
  }
]

count = 0
users.each do |user|
  if User.create(user)

temperatures = [
  {
    name: "Cold"
  },
  {
    name: "Reheated"
  },  
  {
    name: "Hot"
  } 
]

count = 0
temperatures.each do |temperature|
  if Temperature.create(temperature)
    count += 1
  end
end

puts "Created #{count} users"
puts "Created #{count} genres"

# Since we set the primary key (the ID) manually on each of the
# tables, we've got to tell postgres to reload the latest ID
# values. Otherwise when we create a new record it will try
# to start at ID 1, which will be a conflict.
puts "Manually resetting PK sequence on each table"
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

puts "done"
