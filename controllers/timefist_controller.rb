require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/customer.rb' )
require_relative( '../models/game.rb' )
require_relative( '../models/interest.rb' )
require_relative( '../app.rb')
also_reload( '../models/*' )

get '/heavybucketgames/games/timefist' do
     @spaces = Space.all()
     @customer = Customer.all()
     @games = Game.all()
  erb ( :"timefist/home" )
end

get '/heavybucketgames/games/timefist/form' do
    @customer = Customer.all()
  erb ( :"timefist/form" )
end

get '/timefist/status' do
    @customers = Customer.all()
    @interests = Interest.all()
    @games = Game.all()
    @id_inputs = Id_input.all()
    @spaces = Space.all()
    erb ( :"timefist/status" )
end

post "/heavybucketgames/games/timefist" do
   @customer = Customer.new(params)
   @customer.save()
   @games = Game.all()
   @spaces = Space.all()
   for space in @spaces
   x = space.jumper_spaces.to_i
   y = space.timefist_spaces.to_i
   Space.delete_all
   new = Space.new({
           "jumper_spaces" => x,
           "timefist_spaces" => y -= 1
   })
  new.save
  break
       end
   erb ( :"timefist/thanks" )
end

post "/heavybucketgames/timefist/:id/delete" do
   Customer.delete( params[:id].to_i )
   @spaces = Space.all()
   for space in @spaces
   x = space.jumper_spaces.to_i
   y = space.timefist_spaces.to_i
   Space.delete_all
   new = Space.new({
           "jumper_spaces" => x,
           "timefist_spaces" => y += 1
   })
  new.save
  break
       end

  redirect to "/"
end

post "/timefist/timefist/pass" do
  @interests = Interest.all()
  @games = Game.all()
  @id_input = Id_input.new(params)
  @id_input.save()
 erb :"timefist/delete"
end
