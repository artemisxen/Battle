require 'sinatra/base'
require './lib/player'

class Battle < Sinatra::Base
  # get '/' do
  #   "Testing infrastructure working!"
  # end
enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player_1  = Player.new(params[:player_1])
    $player_2  = Player.new(params[:player_2])
    p params
    redirect '/play'
  end

  get '/play' do
    @player_1 = $player_1.name
    @player_2 = $player_2.name
    @player_1_points = $player_1.hp
    @player_2_points = $player_2.hp
    @latest_event = session[:latest_event]
    erb(:play)
  end

  post '/attack' do
    $player_2.reduce_points
    session[:latest_event] = "#{$player_1.name} attacked #{$player_2.name}"
    redirect '/play'
  end

  run! if app_file == $0
end
