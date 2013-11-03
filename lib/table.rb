class Table
  attr_accessor :users, :turn_number, :max_score

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
        puts "#{self.user_in_turn} rolled #{self.user_in_turn.last_roll} Score: #{self.user_in_turn.score}"
        sleep 1
      end
      puts
      
      if game_over?
        break
      else
        self.user_in_turn.last_roll = 0
        self.change_turn()
      end
    end

    puts "#{self.user_in_turn} is the winner!!!"
  end
end