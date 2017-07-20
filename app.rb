require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    $game = Game.new(Player.new(params[:player_1]), Player.new(params[:player_2]))
    redirect '/play'
  end

  get '/play' do
    @player_1 = $game.player_1.name
    @player_2 = $game.player_2.name
    @player_1_points = $game.player_1.hp
    @player_2_points = $game.player_2.hp
    @turn = $game.turn.name
    @latest_event = session[:latest_event]
    erb(:play)
  end

  post '/attack' do
    $game.attack($game.player_2)
    session[:latest_event] = "#{$game.player_1.name} attacked #{$game.player_2.name}"
    redirect '/play'
  end

  run! if app_file == $0
end
