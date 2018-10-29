require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/interest.rb' )
require_relative( '../models/customer.rb' )
require_relative( '../models/game.rb' )
require_relative( '../app.rb')
also_reload( '../models/*' )

get '/heavybucketgames/games/jumper' do
     @spaces = Space.all()
     @customers = Customer.all()
     @games = Game.all()
  erb ( :"jumper/home" )
end

get '/heavybucketgames/games/jumper/form' do
    @customer = Customer.all()
  erb(:"jumper/form")
end

get '/jumper/status' do
    @customers = Customer.all()
    @interests = Interest.all()
    @games = Game.all()
    @id_inputs = Id_input.all()
    @spaces = Space.all()
    erb ( :"jumper/status" )
end

post "/heavybucketgames/games/jumper" do
   @customer = Customer.new(params)
   @customer.save()
   @games = Game.all()
   @spaces = Space.all()
   for space in @spaces
   x = space.jumper_spaces.to_i
   y = space.timefist_spaces.to_i
   Space.delete_all
   new = Space.new({
           "jumper_spaces" => x -= 1,
           "timefist_spaces" => y
   })
  new.save
  break
       end

   erb ( :"jumper/thanks" )
end

post "/heavybucketgames/jumper/:id/delete" do
   Customer.delete( params[:id].to_i )
   @spaces = Space.all()
   for space in @spaces
   x = space.jumper_spaces.to_i
   y = space.timefist_spaces.to_i
   Space.delete_all
   new = Space.new({
           "jumper_spaces" => x += 1,
           "timefist_spaces" => y
   })
  new.save
  break
       end

  redirect to "/"
end

post "/jumper/jumper/pass" do
  @interests = Interest.all()
  @games = Game.all()
  @id_input = Id_input.new(params)
  @id_input.save()
 erb :"jumper/delete"
end
