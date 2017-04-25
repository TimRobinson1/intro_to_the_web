require 'sinatra'
require_relative './lib/player.rb'
require_relative './lib/game.rb'

class Battle < Sinatra::Base
  before do
    @game = Game.current
  end

  get '/' do
    erb(:index)
  end

  post '/names' do
    @game = Game.start(Player.new(params[:player1]), Player.new(params[:player2]))
    redirect '/play'
  end

  get '/play' do
    erb(:play)
  end

  get '/attack' do
    @game.take_damage(@game.other_player)
    redirect '/game-over' if @game.player_down?
    erb(:attack)
  end

  get '/change-turn' do
    @game.switch_player
    erb(:play)
  end

  get '/game-over' do
    erb(:gameover)
  end
end
