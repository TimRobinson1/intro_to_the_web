class Player
  attr_reader :name, :health
  attr_writer :health

  def initialize(name)
    @name = name
    @health = 100
  end

  def take_damage
    @health -= rand(7..18)
  end
end
