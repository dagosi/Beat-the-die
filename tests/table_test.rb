require "test/unit"
require "table"
require "user"

class TableTest < Test::Unit::TestCase
  def setup
    @table = Table.new
  end

  def test_create_table_with_no_users
    assert_equal @table.users, []
  end

  def test_add_user_to_table
    user = User.new(100, "Daniel")
    @table.add_users(user)
    assert_equal [user], @table.users 
  end

  def test_the_first_user_starts_the_game
    capital = 100
    user1 = User.new(capital, "Daniel1")
    user2 = User.new(capital, "Daniel2")
    user3 = User.new(capital, "Daniel3")

    @table.add_users(user1, user2, user3)

    assert_equal user1, @table.user_in_turn
  end
end