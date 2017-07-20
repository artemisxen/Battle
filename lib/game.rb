class Game

  attr_reader :player_1, :player_2, :turn

  def self.start(player_1,player_2)
    @current = Game.new(player_1,player_2)
  end

  def self.current
    @current
  end

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @turn = player_1
  end

  def attack(player)
    player.reduce_points
    switch_turns
  end

  private

  def switch_turns
    @turn = ( turn == player_1 ) ? player_2 : player_1
  end

end
