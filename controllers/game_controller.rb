require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/customer.rb' )
require_relative( '../models/game.rb' )
require_relative( '../models/interest.rb' )
# also_reload( '../models/*' )

# get '/victims' do
#   @victims = Victim.all()
#   erb ( :"victims/index" )
# end
#
# get '/victims/:id' do
#   @victim = Victim.find(params['id'].to_i)
#   erb( :"victims/show" )
# end
