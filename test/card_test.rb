require_relative 'helper'

class CardTest < MiniTest::Unit::TestCase
  def test_card_has_a_suit
    assert_equal :spades, Blackjack::Card.new(9, :spades).suit
  end

  def test_card_has_a_rank
    assert_equal 9, Blackjack::Card.new(9, :spades).rank
  end

  def test_string_formatting
    assert_equal "9s", Blackjack::Card.new(9, :spades).to_s
    assert_equal "Kh", Blackjack::Card.new(13, :hearts).to_s
    assert_equal "Ad", Blackjack::Card.new(1, :diamonds).to_s
    assert_equal "Jc", Blackjack::Card.new(11, :clubs).to_s
  end

  def test_suits
    assert_equal [:spades, :hearts, :diamonds, :clubs], Blackjack::Card::SUITS
  end

  def test_make_deck
    assert_equal 52, Blackjack::Card.make_deck.size
  end

  def test_rank_over_10_scores_10
    assert_equal 10, Blackjack::Card.new(11, :hearts).score
  end

  def test_aces_score_11
    assert_equal 11, Blackjack::Card.new(1, :hearts).score
  end
end
