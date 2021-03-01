class Players

  attr_accessor :name, :lives

  def initialize(name, lives = 3)
    @lives = lives
    @name = name
  end

  def lose_lives
    @lives -= 1
  end
end

