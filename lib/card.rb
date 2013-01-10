class Card
  attr_reader :rank, :suit

  def self.full_deck
    result = []
    [:spades, :hearts, :diamonds, :clubs].each do |suit|
      (1..13).each do |rank|
        result << new(rank, suit)
      end
    end
    result
  end
  
  def initialize(rank, suit)
    @rank, @suit = rank, suit
  end

  def to_s
    suit_letter = @suit.to_s[0]
    "#{rank_as_letter}#{suit_letter}"
  end

  def value
    if @rank > 10
      10
    elsif @rank == 1
      11
    else
      @rank
    end
  end
  
  private
  
  def rank_as_letter
    case @rank
    when 1
      "A"
    when 2..9
      @rank
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
