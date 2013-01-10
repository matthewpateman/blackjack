class Hand
  include Comparable
  
  def initialize(cards)
    @cards = cards
  end

  def <=>(other_hand)
    value <=> other_hand.value
  end
  
  # Returns the total value of the hand, taking into account aces can
  # be 1 or 11.
  def value
    result = 0
    @cards.each {|card| result += card.value }
    adjust_result_for_aces(result)
  end

  def add(card)
    @cards << card
  end
  
  def to_s
    @cards.map {|card| card.to_s }.join(', ')
  end

  def bust?
    value > 21
  end

  private

  def adjust_result_for_aces(result)
    number_of_aces = 0
    @cards.each do |card|
      number_of_aces += 1 if card.rank == 1
    end

    while result > 21 && number_of_aces > 0
      result -= 10
      number_of_aces -= 1
    end
    result
  end
end
