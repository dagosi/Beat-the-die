def print_welcome_message
  puts "*******************"
  puts "*Welcome to greed!*"
  puts "*******************\n\n"  
end

def get_num_players
  @table = Table.new
  puts "How many player are betting today?"
  @num_players = gets.chomp  
end

def get_capital
  puts "How much is the initial money?"
  @capital = gets.chomp  
end

def get_max_score
  puts "What is the top score?"
  @table.max_score = gets.chomp
end

def get_players
  puts "Please enter the names of the players."

  @num_players.times do
    user_name = gets.chomp
    @table << User.new(capital, user_name)
  end  
end

print_welcome_message()
get_capital()
get_num_players()
get_players()
