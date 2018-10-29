require_relative( "../models/customer.rb" )
require_relative( "../models/game.rb" )
require_relative( "../models/interest.rb" )
require_relative( "../models/id_input.rb" )
require_relative( "../models/space.rb" )
require("pry-byebug")

Interest.delete_all()
Game.delete_all()
Customer.delete_all()
Id_input.delete_all()
Space.delete_all()

# input1 = Id_input.new({
#   "id_input" => 23
# })
# input1.save
#
# game1 = Game.new({
#   "title" => "time fist",
#   "genre" => "comedy adventure",
#   "release_date" => "01/01/2019"
# })
# game1.save
#
# game2 = Game.new({
#   "title" => "water chaser",
#   "genre" => "platformer",
#   "release_date" => "02/07/2019"
# })
# game2.save
#
# game3 = Game.new({
#   "title" => "adventure tale",
#   "genre" => "ebook",
#   "release_date" => "09/03/2019"
# })
# game3.save
#
# customer1 = Customer.new({
#   "name" => "Peasley",
#   "email" => "lindonpeasley@gmail.com"
# })
# customer1.save
#
# customer2 = Customer.new({
#   "name" => "Biggie",
#   "email" => "biggie@gmail.com"
# })
# customer2.save
#
# customer3 = Customer.new({
#   "name" => "Dakinman",
#   "email" => "dakin@gmail.com"
# })
# customer3.save
#
# interest1 = Interest.new({
#   "game_id" => game1.id,
#   "customer_id" => customer1.id
# })
#
# interest1.save
#
# space = Space.new({
#           "jumper_spaces" => 20,
#           "timefist_spaces" => 20
#   })
# space.save
#
# space.jumper_spaces += 1
# space.update



# binding.pry
# nil
