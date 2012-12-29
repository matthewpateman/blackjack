module Blackjack
  class Game
    def initialize(ui=ConsoleUI.new)
      @ui = ui
    end

    def run
      @ui.display_welcome

      loop do
        deck = Card.make_deck.shuffle
        player = Hand.new(deck.pop(2))
        dealer = Hand.new(deck.pop(2))
      
        player_turn(player, dealer, deck)
        dealer_turn(player, dealer, deck)
        
        @ui.display_winner(calculate_winner(player, dealer))

        break unless @ui.play_another_round?
      end
    end

    def player_turn(player, dealer, deck)
      until player.bust?
        input = @ui.get_player_choice(player, dealer)

        if input == "h"
          player.add(deck.pop)
        elsif input == "s"
          break
        else
          @ui.display_incorrect_input
        end
      end
    end

    def dealer_turn(player, dealer, deck)
      until dealer.score >= 17
        dealer.add(deck.pop)
      end
    end
    
    def calculate_winner(player, dealer)
      if player.bust?
        :dealer
      elsif dealer.bust?
        :player
      elsif player.score > dealer.score
        :player
      else
        :dealer
      end
    end
  end
end
