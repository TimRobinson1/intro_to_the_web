class Game
  attr_reader :p1, :p2, :current_player, :other_player

  def initialize(player1, player2)
    @p1 = player1
    @p2 = player2
    @current_player = @p1
    @other_player = @p2
  end

  def self.start(player1, player2)
    @game = Game.new(player1, player2)
  end

  def self.current
    @game
  end

  def p1_name
    @p1.name
  end

  def p2_name
    @p2.name
  end

  def p1_health
    @p1.health
  end

  def p2_health
    @p2.health
  end

  def switch_player
    if @current_player == @p1
      @current_player, @other_player = @p2, @p1
    else
      @current_player, @other_player = @p1, @p2
    end
  end

  def player_down?
    @p1.health <= 0 || @p2.health <= 0
  end

  def take_damage(player)
    player.take_damage
  end

end
