class Round
  attr_reader :player_hand, :dealer_hand
  
  def initialize(deck)
    @deck = deck

    @player_hand = Hand.new(@deck.pop(2))
    @dealer_hand = Hand.new(@deck.pop(2))
  end

  def player_hit
    raise "Can't hit if bust" if @player_hand.bust?
    
    @player_hand.add @deck.pop
  end

  def dealer_turn
    while @dealer_hand.value <= 16
      @dealer_hand.add @deck.pop
    end
  end

  def winner
    if @player_hand.bust?
      :dealer
    elsif @dealer_hand.bust?
      :player
    elsif @dealer_hand >= @player_hand
      :dealer
    else
      :player
    end
  end
end
