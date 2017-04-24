require 'sinatra'

class Battle < Sinatra::Base

  get '/' do
    erb(:index)
  end

  post '/names' do
    p params[:player1]
    p params[:player2]
    @player1 = params[:player1]
    @player2 = params[:player2]
    erb(:play)
  end
end
