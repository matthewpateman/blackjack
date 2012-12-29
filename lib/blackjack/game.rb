module Blackjack
  class Game
    def run
      puts "Welcome to Blackjack"

      deck = Card.make_deck.shuffle
      player = Hand.new(deck.pop(2))
      dealer = Hand.new(deck.pop(2))
      
      player_turn(player, dealer, deck)
      dealer_turn(player, dealer, deck)

      display_winner(calculate_winner(player, dealer))
    end

    def player_turn(player, dealer, deck)
      until player.bust?
        input = get_player_choice(player, dealer)

        if input == "h"
          player.add(deck.pop)
        elsif input == "s"
          break
        else
          puts "Input not valid"
        end
      end
    end

    def dealer_turn(player, dealer, deck)
      until dealer.score >= 17
        dealer.add(deck.pop)
      end
    end

    def display_winner(winner)
      if winner == :player
        puts "You win"
      else
        puts "You lose"
      end
    end
    
    def get_player_choice(player, dealer)
      puts "The dealer's hand is #{dealer} (#{dealer.score})"
      puts "Your hand is #{player} (#{player.score})"
      puts "[h]it or [s]tand?:"
      gets.strip[0].downcase
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
