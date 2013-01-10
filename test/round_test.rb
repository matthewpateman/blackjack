require 'helper'

class RoundTest < MiniTest::Unit::TestCase
  def setup
    @deck = Card.full_deck
    @round = Round.new(@deck)
  end

  def test_player_hand
    assert_equal "Qc, Kc", @round.player_hand.to_s
  end

  def test_dealer_hand
    assert_equal "Tc, Jc", @round.dealer_hand.to_s
  end

  def test_dealer_hand
    @round.player_hit
    
    assert_equal "Qc, Kc, 9c", @round.player_hand.to_s
  end
end
