require 'sinatra'
require_relative './lib/player.rb'
require_relative './lib/game.rb'

class Battle < Sinatra::Base
  enable :sessions

  # This allows shotgun to persist in storing session variables
  configure(:development) { set :session_secret, "something" }

  get '/' do
    erb(:index)
  end

  post '/names' do
    $game = Game.new(Player.new(params[:player1]), Player.new(params[:player2]))
    redirect '/play'
  end

  get '/play' do
    erb(:play)
  end

  get '/attack' do
    $game.take_damage($game.other_player)
    redirect '/game-over' if $game.player_down?
    erb(:attack)
  end

  get '/change-turn' do
    $game.switch_player
    erb(:play)
  end

  get '/game-over' do
    erb(:gameover)
  end

  #
  # get '/play' do
  #   p "IN PLAY", session[:player2]
  #   @player1 = session[:player1]
  #   @player2 = session[:player2]
  #   erb(:play)
  # end
end
