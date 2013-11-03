require "test/unit"
require "table"
require "user"

class TableTest < Test::Unit::TestCase
  def setup
    @table = Table.new(100)
    @user1 = User.new("Daniel1")
    @user2 = User.new("Daniel2")
    @user3 = User.new("Daniel3")
  end

  def test_create_table_with_no_users
    assert_equal @table.users, []
  end

  def test_add_user_to_table
    @table.add_users(@user1)
    assert_equal [@user1], @table.users 
  end

  def test_the_first_user_starts_the_game
    @table.add_users(@user1, @user2, @user3)

    assert_equal @user1, @table.user_in_turn
  end

  def test_game_over_when_max_score
    @table.add_users(@user1)

    final_score = @table.max_score
    @user1.stubs(:score).returns(final_score)
    assert_equal true, @table.game_over?
  end

  def test_game_over_when_up_max_score
    @table.add_users(@user1)

    final_score = @table.max_score + 3
    @user1.stubs(:score).returns(final_score)
    assert_equal true, @table.game_over?
  end

  def test_should_not_be_game_over
    @table.add_users(@user1)

    final_score = @table.max_score - 3
    @user1.stubs(:score).returns(final_score)
    assert_equal false, @table.game_over?
  end

  def test_change_turn
    @table.add_users(@user1, @user2)
    @table.change_turn
    assert_equal @user2, @table.user_in_turn
  end

  def test_change_turn_several_times
    @table.add_users(@user1, @user2, @user3)
    
    @table.change_turn
    assert_equal @user2, @table.user_in_turn

    @table.change_turn
    assert_equal @user3, @table.user_in_turn

    @table.change_turn
    assert_equal @user1, @table.user_in_turn
  end

  def test_start_game
    @table.add_users(@user1, @user2, @user3)
    @table.max_score = 10

    @user1.stubs(:roll).returns(2)
    @table.start_game

    assert_equal @user1, @table.winner
  end
end