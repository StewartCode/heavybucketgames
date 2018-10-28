require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/jumper_controller')
require_relative('controllers/game_controller')
require_relative('controllers/timefist_controller')
require("pry-byebug")

Game.delete_all()

@game1 = Game.new({
  "title" => "time fist",
  "genre" => "comedy adventure",
  "release_date" => "01/01/2019"
})
@game1.save

@game2 = Game.new({
  "title" => "jumper",
  "genre" => "platformer",
  "release_date" => "02/07/2019"
})
@game2.save

# @game3 = Game.new({
#   "title" => "adventure tale",
#   "genre" => "ebook",
#   "release_date" => "09/03/2019"
# })
# @game3.save

get '/' do
  erb( :index )
end

# binding.pry
# nil
