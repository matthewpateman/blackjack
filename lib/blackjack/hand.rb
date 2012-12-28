module Blackjack
  class Hand
    def initialize(cards)
      @cards = cards
    end

    def score
      total = 0
      number_of_aces = 0

      @cards.each do |card|
        total += card.score
        number_of_aces += 1 if card.ace?
      end

      while total > 21 && number_of_aces > 0
        total -= 10
        number_of_aces -= 1
      end
      
      total
    end
  end
end
