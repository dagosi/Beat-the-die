class Table
  attr_accessor :users, :turn_number, :max_score, :winner

  def initialize()
    @users = []
    @turn_number = 0
  end

  def add_users(*users)
    users.each { |user| @users << user }
  end

  def user_in_turn
    @users[@turn_number]
  end

  def game_over?
    user_in_turn.score >= @max_score
  end

  def change_turn
    if @turn_number < @users.size - 1
      @turn_number += 1
    else
      @turn_number = 0
    end
  end

  def start_game
    while !game_over?
      while user_in_turn.can_roll_again?(@max_score)
        user_in_turn.play
      end
    end

    @winner = user_in_turn
  end
end