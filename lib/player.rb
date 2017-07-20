class Player
  attr_reader :name, :hp
  DEFAULT_HP = 100
  def initialize(name)
    @name = name
    @hp = DEFAULT_HP
  end

  def reduce_points(damage = rand(0..40))
    @hp -= damage
  end
end
