module Blackjack
  class Card
    SUITS = [:spades, :hearts, :diamonds, :clubs]
    
    attr_reader :rank, :suit

    # Creates a full 52 card deck as an array
    def self.make_deck
      deck = []
      SUITS.each do |suit|
        (1..13).each do |rank|
          deck << new(rank, suit)
        end
      end
      deck
    end
    
    def initialize(rank, suit)
      @rank = rank
      @suit = suit
    end

    def score
      if @rank > 10
        10
      else
        @rank
      end
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
