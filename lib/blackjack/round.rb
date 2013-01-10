module Blackjack
  class Round
    attr_reader :player_hand, :dealer_hand
  
    def initialize(deck)
      @deck = deck
      @player = Hand.new(deck.shift(2))
      @dealer = Hand.new(deck.shift(2))
    end
    
    def player_turn
      until @player.bust?
        input = get_player_choice(@player, @dealer)
        
        if input == "h"
          @player.add(@deck.pop)
        elsif input == "s"
          break
        else
          puts "Input not valid"
        end
      end
    end

    def dealer_turn
      until @dealer.score >= 17
        @dealer.add(@deck.pop)
      end
    end
    
    def winner
      if @player.bust?
        :dealer
      elsif @dealer.bust?
        :player
      elsif @player.score > @dealer.score
        :player
      else
        :dealer
      end
    end

    def get_player_choice
      puts "The dealer's hand is #{@dealer} (#{@dealer.score})"
      puts "Your hand is #{@player} (#{@player.score})"
      puts "[h]it or [s]tand?:"
      gets.strip[0].downcase
    end
  end
end
