require './environment'
require_relative './app/models/ship.rb'
require_relative './app/models/pirate.rb'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    
    get '/' do
      erb :root
    end
    
    get '/new' do
      erb :'pirates/new'
    end
    
    post '/pirates' do
      
      @pirate = Pirate.new(params[:pirate])
 
      params[:pirate][:ships].each do |details|
        Ship.new(details)
      end
     
    #  @ships = Ships.all
      
      erb :'pirates/show'

    end
  end
    
end
