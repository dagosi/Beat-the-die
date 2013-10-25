require 'dice'

class Table
  attr_accessor :users, :turn_number

  def initialize()
    @users = []
    @turn_number = 0
    @dice = Dice.new
  end

  def add_users(*users)
    users.each { |user| @users << user }
  end

  def user_in_turn
    @users[@turn_number]
  end
end