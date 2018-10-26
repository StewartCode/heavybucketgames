require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/jumper_controller')
require_relative('controllers/game_controller')
require_relative('controllers/timefist_controller')

get '/' do
  erb( :index )
end
