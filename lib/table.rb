class Table
  attr_accessor :users, :turn_number, :max_score, :winner

  def initialize(max_score)
    @users = []
    @turn_number = 0
    @max_score = max_score
  end

  def add_users(*users)
    users.each { |user| @users << user }
  end

  def user_in_turn
    @users[@turn_number]
  end

  def game_over?
    self.user_in_turn.score >= @max_score
  end

  def change_turn
    if @turn_number < @users.size - 1
      @turn_number += 1
    else
      @turn_number = 0
    end
  end

  def start_game
    while true
      while self.user_in_turn.can_roll_again?(@max_score)
        self.user_in_turn.play
        puts "#{self.user_in_turn} rolled #{self.user_in_turn.last_roll}"
        puts "Total #{self.user_in_turn.score}"
      end

      if game_over?
        break
      else
        self.change_turn()
      end
    end

    @winner = self.user_in_turn()
  end
end