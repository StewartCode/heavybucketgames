# require("minitest/autorun")
# require_relative("../customer.rb")
# require_relative("../game.rb")
# require_relative("../interest.rb")
#
# class TestAllModels < MiniTest::Test
#
#   def setup
#     game1 = Game.new({
#       "title" => "time fist",
#       "genre" => "comedy adventure",
#       "release_date" => "01/01/2019"
#     })
#     game1.save
#
#     game2 = Game.new({
#       "title" => "water chaser",
#       "genre" => "platformer",
#       "release_date" => "02/07/2019"
#     })
#     game2.save
#
#     customer1 = Customer.new({
#       "name" => "Peasley",
#       "email" => "lindonpeasley@gmail.com"
#     })
#     customer1.save
#
#     customer2 = Customer.new({
#       "name" => "Biggie",
#       "email" => "biggie@gmail.com"
#     })
#     customer2.save
#
#     interest1 = Interest.new({
#       "game_id" => game1.id,
#       "customer_id" => customer1.id
#     })
#
#     interest1.save
#   end
