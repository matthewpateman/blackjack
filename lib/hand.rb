class Hand
  def initialize(cards)
    @cards = cards
  end

  # Returns the total value of the hand, taking into account aces can
  # be 1 or 11.
  def value
    result = 0
    number_of_aces = 0

    @cards.each do |card|
      result += card.value
      number_of_aces += 1 if card.rank == 1
    end

    adjust_result_for_aces(result, number_of_aces)
  end

  def to_s
    @cards.map {|card| card.to_s }.join(', ')
  end

  def bust?
    value > 21
  end

  private

  def adjust_result_for_aces(result, number_of_aces)
    while result > 21 && number_of_aces > 0
      result -= 10
      number_of_aces -= 1
    end
    result
  end
end
