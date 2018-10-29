require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/interest.rb' )
require_relative( '../models/customer.rb' )
require_relative( '../models/game.rb' )
require_relative( '../app.rb')
also_reload( '../models/*' )

get '/heavybucketgames/games/jumper' do
  erb ( :"jumper/home" )
end

get '/heavybucketgames/games/jumper/form' do
    @customer = Customer.all()
  erb(:"jumper/form")
end

post "/heavybucketgames/games/jumper" do
   @customer = Customer.new(params)
   @customer.save()
   @games = Game.all()

   erb ( :"jumper/thanks" )
end

# post '/heavybucketgames/games/jumper/interest' do
#   interest = Interest.new(params)
#   interest.save
#   redirect to("/heavybucketgames/games/jumper")
# end
# post '/bitings' do
#   biting = Biting.new(params)
#   biting.save
#   redirect to("/bitings")
# end
#
# post '/bitings/:id/delete' do
#   Biting.destroy(params[:id])
#   redirect to("/bitings")
# end
