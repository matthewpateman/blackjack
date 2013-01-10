require_relative 'helper'

class CardTest < MiniTest::Unit::TestCase
  def test_card_has_a_suit
    card = Card.new(7, :spades)
    assert_equal :spades, card.suit
  end

  def test_card_has_a_rank
    card = Card.new(7, :spades)
    assert_equal 7, card.rank
  end

  def test_number_card_as_string
    card = Card.new(7, :spades)
    assert_equal "7s", card.to_s
  end

  def test_picture_card_as_string
    card = Card.new(13, :spades)
    assert_equal "Ks", card.to_s
  end

  def test_number_card_value
    card = Card.new(7, :spades)
    assert_equal 7, card.value
  end

  def test_picture_card_value
    card = Card.new(12, :spades)
    assert_equal 10, card.value
  end

  def test_picture_card_value
    card = Card.new(1, :spades)
    assert_equal 11, card.value
  end

  def test_size_of_deck
    assert_equal 52, Card.full_deck.size
  end
end
