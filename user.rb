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

  def can_roll_again?
    @last_roll != 1
  end
end