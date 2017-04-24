require 'sinatra'
require_relative './lib/player'

class Battle < Sinatra::Base
  enable :sessions

  # This allows shotgun to persist in storing session variables
  configure(:development) { set :session_secret, "something" }

  get '/' do
    erb(:index)
  end

  post '/names' do
    $game = Game.new
    $player1 = Player.new(params[:player1])
    $player2 = Player.new(params[:player2])
    redirect '/play'
  end

  get '/play' do
    @player1 = $player1.name
    @player2 = $player2.name
    erb(:play)
  end

  get '/attack' do
    @player1 = $player1.name
    @player2 = $player2.name
    $game.take_damage(@player2)
    erb(:attack)
  end

  #
  # get '/play' do
  #   p "IN PLAY", session[:player2]
  #   @player1 = session[:player1]
  #   @player2 = session[:player2]
  #   erb(:play)
  # end
end
