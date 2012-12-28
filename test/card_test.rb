require_relative 'helper'

class CardTest < MiniTest::Unit::TestCase
  def test_card_has_a_suit
    assert_equal :spades, Blackjack::Card.new(9, :spades).suit
  end

  def test_card_has_a_rank
    assert_equal 9, Blackjack::Card.new(9, :spades).rank
  end
end
