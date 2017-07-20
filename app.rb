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

  post '/attack_1' do
    $game.attack($game.player_2)
    session[:latest_event] = "#{$game.player_1.name} attacked #{$game.player_2.name}"
    check_if_game_over($game.player_2)
  end

  post '/attack_2' do
    $game.attack($game.player_1)
    session[:latest_event] = "#{$game.player_2.name} attacked #{$game.player_1.name}"
    check_if_game_over($game.player_1)
  end

  get '/lose' do
    @loser = session[:loser]
    erb(:lose)
  end

  def check_if_game_over(player)
    if player.hp == 0
      session[:loser] = player.name
      redirect('/lose')
    else
      redirect('/play')
    end
  end

  run! if app_file == $0
end
