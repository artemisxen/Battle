class Player
  attr_reader :name, :hp
  DEFAULT_HP = 60
  def initialize(name)
    @name = name
    @hp = DEFAULT_HP
  end

  def reduce_points
    @hp -= 10
  end
end
