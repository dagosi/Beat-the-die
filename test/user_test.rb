require "test/unit"
require "user"

class UserTest < Test::Unit::TestCase
  def setup
    @user_name = "Daniel"
    @capital = 1000
    @user = User.new(@capital, @user_name)
  end

  def test_user_with_name_and_capital_after_creation
    assert_equal @user_name, @user.name
    assert_equal @capital, @user.capital
  end

  def test_user_name_when_print_object
    assert_equal @user_name, @user.to_s
  end

  def test_user_can_roll_again
    (2..6).each do |n|
      @user.last_roll = n
      assert_equal true, @user.can_roll_again?
    end
  end

  def test_user_cannot_roll_again
    @user.last_roll = 1
    assert_equal false, @user.can_roll_again? 
  end
end