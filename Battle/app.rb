require 'sinatra'

class Battle < Sinatra::Base
  enable :sessions

  # This allows shotgun to persist in storing session variables
  configure(:development) { set :session_secret, "something" }

  get '/' do
    erb(:index)
  end

  post '/names' do
    session[:p1] = params[:player1]
    session[:p2] = params[:player2]
    redirect '/play'
  end

  get '/play' do
    @player1 = session[:p1]
    @player2 = session[:p2]
    erb(:play)
  end

  #
  # get '/play' do
  #   p "IN PLAY", session[:player2]
  #   @player1 = session[:player1]
  #   @player2 = session[:player2]
  #   erb(:play)
  # end
end
