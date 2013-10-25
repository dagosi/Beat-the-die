require 'test/unit'
require 'dice'

class DiceTest < Test::Unit::TestCase
  def setup
    @dice = Dice.new
  end

  def test_rolled_dice_is_a_number
    number = @dice.roll    
    assert_kind_of Fixnum, number, "Dice roll should return a number."
  end

  def test_rolled_dice_is_not_nil
    number = @dice.roll
    assert_not_nil number, "The number of the rolled dice shoudn't be nil."
  end

  def test_dice_limits
    number = @dice.roll
    assert_operator number, :>=, 1, "The number of the rolled dice should be greater or equal to 1."
    assert_operator number, :<=, 6, "The number of the rolled dice should be less or equal to 6."
  end

  def test_rolled_dice_should_be_random
    results = []
    1000.times { results << @dice.roll }
    assert_operator results.uniq.size, :==, 6
  end
end