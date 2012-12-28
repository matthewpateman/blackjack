require_relative 'helper'

class HandTest < MiniTest::Unit::TestCase
  def test_hand_score_is_sum_of_number_card_ranks
    cards = [Blackjack::Card.new(3, :diamonds),
             Blackjack::Card.new(5, :clubs)]

    assert_equal 8, Blackjack::Hand.new(cards).score
  end

  def test_hand_score_uses_10_for_picture_cards
    cards = [Blackjack::Card.new(3, :diamonds),
             Blackjack::Card.new(12, :clubs)]

    assert_equal 13, Blackjack::Hand.new(cards).score
  end

  def test_hand_score_uses_11_for_aces_when_possible
    cards = [Blackjack::Card.new(1, :diamonds),
             Blackjack::Card.new(12, :clubs)]

    assert_equal 21, Blackjack::Hand.new(cards).score
  end

  def test_hand_score_uses_11_for_aces_when_necessary
    cards = [Blackjack::Card.new(1, :diamonds),
             Blackjack::Card.new(1, :clubs),
             Blackjack::Card.new(12, :hearts)]

    assert_equal 12, Blackjack::Hand.new(cards).score
  end
end
