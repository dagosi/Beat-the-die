require "test/unit"
require "user"
require 'mocha/setup'

class UserTest < Test::Unit::TestCase
  def setup
    @user_name = "Daniel"
    @capital = 1000
    @user = User.new(@capital, @user_name)
  end

  def test_rolled_dice_is_a_number
    number = @user.roll    
    assert_kind_of Fixnum, number, "Dice roll should return a number."
  end

  def test_rolled_dice_is_not_nil
    number = @user.roll
    assert_not_nil number, "The number of the rolled dice shoudn't be nil."
  end

  def test_dice_limits
    number = @user.roll
    assert_operator number, :>=, 1, "The number of the rolled dice should be greater or equal to 1."
    assert_operator number, :<=, 6, "The number of the rolled dice should be less or equal to 6."
  end

  def test_rolled_dice_should_be_random
    results = []
    1000.times { results << @user.roll }
    assert_operator results.uniq.size, :==, 6
  end

  def test_user_storages_last_roll
    @user.expects(:roll).returns(5)
    @user.play
    assert_equal 5, @user.last_roll
  end

  def test_user_storages_score
    @user.expects(:roll).returns(4)
    @user.play
    assert_equal 4, @user.score
  end

  def test_user_accumulates_score
    (2..5).each do |number|
      @user.expects(:roll).returns(number)
      @user.play
    end

    assert_equal (2..5).inject(:+), @user.score
  end

  def test_user_with_name_and_capital_after_creation
    assert_equal @user_name, @user.name
    assert_equal @capital, @user.capital
  end

  def test_user_name_when_print_object
    assert_equal @user_name, @user.to_s
  end

  def test_user_can_roll_again
    (2..4).each do |n| 
      @user.last_roll = n 
      assert_equal true, @user.can_roll_again?(100)
    end
  end

  def test_user_can_roll_again_when_score
    @user.score = 60
    assert_equal true, @user.can_roll_again?(100)  
  end

  def test_user_cannot_roll_again_when_one
    @user.last_roll = 1
    assert_equal false, @user.can_roll_again?(10) 
  end

  def test_user_cannot_roll_again_when_max_score
    @user.score = 100
    assert_equal false, @user.can_roll_again?(100)

    @user.score = 101
    assert_equal false, @user.can_roll_again?(100)
  end
end