class Player
  attr_reader :name, :hp
  DEFAULT_HP = 60
  DEFAULT_ATTACK = 10
  def initialize(name)
    @name = name
    @hp = DEFAULT_HP
  end

  def reduce_points
    @hp -= DEFAULT_ATTACK
  end
end
