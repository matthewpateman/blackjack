module Blackjack
  class Card
    attr_reader :rank, :suit
    
    def initialize(rank, suit)
      @rank = rank
      @suit = suit
    end

    def to_s
      rank_letter + suit.to_s[0]
    end

    def rank_letter
      case rank
      when 1
        "A"
      when 2..9
        rank.to_s
      when 10
        "T"
      when 11
        "J"
      when 12
        "Q"
      when 13
        "K"
      end
    end
  end
end
