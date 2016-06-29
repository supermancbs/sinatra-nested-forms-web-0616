require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here

    get '/' do 
      erb :root

    end 

    get '/new' do 
      erb :"pirates/new"
    end 

    post '/pirates' do 
      @pirate = Pirate.new

      @pirate.name = params[:pirate][:name]
      @pirate.weight = params[:pirate][:weight]
      @pirate.height = params[:pirate][:height]
      
      params[:pirate][:ships].each do |ship|
        Ship.new(ship[:name], ship[:type], ship[:booty])
      end 
      
      @ships = Ship.all
    
      erb :"pirates/show"
    end 

  end
end
