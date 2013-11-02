class User
  attr_accessor :capital, :name, :score, :last_roll

  def initialize(capital, name)
    @capital = capital
    @name = name
    @score = 0
    @last_roll = 0
  end

  def to_s
    "#{self.name}"
  end

  def can_roll_again?(max_score)
    @last_roll != 1 && @score < max_score
  end

  def roll
    rand(1..6)
  end

  def play
    @last_roll = self.roll
    @score += @last_roll
  end
end