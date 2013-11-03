require_relative "table"
require_relative "user"

def print_welcome_message
  puts "***********************"
  puts "** Welcome to greed! **"
  puts "***********************\n\n"  
end

def get_num_players
  @table = Table.new(@max_score)
  puts "How many players are playing?"
  @num_players = gets.chomp.to_i
end

def get_max_score
  puts "What is the top score?"
  @max_score = gets.chomp.to_i
end

def get_players
  puts "Please enter the names of the players"

  @num_players.times do
    user_name = gets.chomp
    @table.users << User.new(user_name)
  end  
end

print_welcome_message()
get_max_score()
get_num_players()
get_players()
@table.start_game
