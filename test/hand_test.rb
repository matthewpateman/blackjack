require_relative 'helper'

class HandTest < MiniTest::Unit::TestCase
  def test_simple_hand_value
    hand = Hand.new([Card.new(3, :hearts),
                     Card.new(9, :spades)])
    assert_equal 12, hand.value
  end

  def test_hand_can_be_displayed
    hand = Hand.new([Card.new(3, :hearts),
                     Card.new(9, :spades)])
    assert_equal "3h, 9s", hand.to_s
  end

  def test_hand_is_bust_over_21
    hand = Hand.new([Card.new(3, :hearts),
                     Card.new(9, :spades),
                     Card.new(10, :spades)])
    assert hand.bust?
  end

  def test_hand_is_not_bust_when_21
    hand = Hand.new([Card.new(3, :hearts),
                     Card.new(9, :spades),
                     Card.new(9, :clubs)])
    refute hand.bust?
  end

  def test_ace_is_11
    hand = Hand.new([Card.new(1, :hearts),
                     Card.new(9, :spades)])
    assert_equal 20, hand.value
  end

  def test_ace_is_1_when_appropriate
    hand = Hand.new([Card.new(1, :hearts),
                     Card.new(9, :spades),
                     Card.new(2, :clubs)
                    ])
    assert_equal 12, hand.value
  end

  def test_multiple_aces_are_1_when_appropriate
    hand = Hand.new([Card.new(1, :hearts),
                     Card.new(1, :spades),
                     Card.new(1, :clubs),
                     Card.new(1, :diamonds)
                    ])
    assert_equal 14, hand.value
  end
end
