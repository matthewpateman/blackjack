module Blackjack
  class Hand
    def initialize(cards)
      @cards = cards
    end

    def score
      total = 0
      @cards.each {|card| total += card.rank }
      total
    end
  end
end
