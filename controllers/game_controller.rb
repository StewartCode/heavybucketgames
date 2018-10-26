require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/customer.rb' )
require_relative( '../models/game.rb' )
require_relative( '../models/interest.rb' )
also_reload( '../models/*' )

get '/heavybucketgames/games' do
   @games = Game.all()
  erb ( :"game/index" )
end
