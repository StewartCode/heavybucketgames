require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/customer.rb' )
require_relative( '../models/game.rb' )
require_relative( '../models/interest.rb' )
require_relative( '../models/id_input.rb' )
also_reload( '../models/*' )

get '/heavybucketgames/games' do
   @games = Game.all()
  erb ( :"game/index" )
end

get '/heavybucketgames/games/shortlist' do
   @interests = Interest.all()
   @games = Game.all()
   @customers = Customer.all()
  erb ( :"game/shortlist" )
end

get '/status' do
    @customers = Customer.all()
    @interests = Interest.all()
    @games = Game.all()
    @id_inputs = Id_input.all()
    erb ( :status )
end

post "/pass" do
  @interests = Interest.all()
  @id_input = Id_input.new(params)
  @id_input.save()
 erb :delete
end

post "/heavybucketgames/:id/delete" do
   Customer.delete( params[:id].to_i )
  redirect to "/"
end
# post 'heavybucketgames/delete/:id' do
#     @customer = Customer.delete(params [:id])
#     erb ( :delete )
# end

get '/heavybucketgames/games/find/:id' do # show
  @customer = Customer.find( params['id'].to_i )
  erb( :"game/find" )
end

# get '/victims/:id' do
#   @victim = Victim.find(params['id'].to_i)
#   erb( :"victims/show" )
# end
