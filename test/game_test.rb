require_relative 'helper'

class GameTest < MiniTest::Unit::TestCase
  def setup
    @game = Blackjack::Game.new
  end

  def test_dealer_wins_if_player_bust
    player_hand = Blackjack::Hand.new([Blackjack::Card.new(12, :diamonds),
                                       Blackjack::Card.new(12, :clubs),
                                       Blackjack::Card.new(12, :spades)])
    dealer_hand = Blackjack::Hand.new([Blackjack::Card.new(11, :diamonds),
                                       Blackjack::Card.new(11, :clubs),
                                       Blackjack::Card.new(11, :spades)])

    assert_equal :dealer, @game.calculate_winner(player_hand, dealer_hand)
  end

  def test_player_wins_if_dealer_bust
    player_hand = Blackjack::Hand.new([Blackjack::Card.new(12, :diamonds),
                                       Blackjack::Card.new(12, :spades)])
    dealer_hand = Blackjack::Hand.new([Blackjack::Card.new(11, :diamonds),
                                       Blackjack::Card.new(11, :clubs),
                                       Blackjack::Card.new(11, :spades)])

    assert_equal :player, @game.calculate_winner(player_hand, dealer_hand)
  end

  def test_dealer_wins_if_scores_eqaul
    player_hand = Blackjack::Hand.new([Blackjack::Card.new(12, :diamonds),
                                       Blackjack::Card.new(12, :spades)])
    dealer_hand = Blackjack::Hand.new([Blackjack::Card.new(11, :diamonds),
                                       Blackjack::Card.new(11, :spades)])

    assert_equal :dealer, @game.calculate_winner(player_hand, dealer_hand)
  end

  def test_player_wins_if_scores_higher
    player_hand = Blackjack::Hand.new([Blackjack::Card.new(12, :diamonds),
                                       Blackjack::Card.new(12, :spades)])
    dealer_hand = Blackjack::Hand.new([Blackjack::Card.new(3, :diamonds),
                                       Blackjack::Card.new(11, :spades)])

    assert_equal :player, @game.calculate_winner(player_hand, dealer_hand)
  end
end
