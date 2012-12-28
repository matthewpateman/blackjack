module Blackjack
  class Hand
    def initialize(cards)
      @cards = cards
    end

    def score
      total = 0
      @cards.each do |card|
        if card.rank > 10
          total += 10
        else
          total += card.rank
        end
      end
      total
    end
  end
end
