require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/customer.rb' )
require_relative( '../models/game.rb' )
require_relative( '../models/interest.rb' )
 also_reload( '../models/*' )

get '/heavybucketgames/games/timefist' do
  erb ( :"timefist/home" )
end

get '/heavybucketgames/games/timefist/form' do
    @customer = Customer.all()
  erb ( :"timefist/form" )
end

post "/heavybucketgames/games/timefist" do
   @customer = Customer.new(params)
   @customer.save()
  erb ( :thanks )
end
