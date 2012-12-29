module Blackjack
  class Game
    def run      
      puts "Welcome to Blackjack"

      deck = Card.make_deck.shuffle

      player = Hand.new(deck.pop(2))
      dealer = Hand.new(deck.pop(2))

      until player.bust?
        puts "The dealer's hand is #{dealer} (#{dealer.score})"
        puts "Your hand is #{player} (#{player.score})"
        puts "[h]it or [s]tand?:"

        input = gets.strip[0].downcase

        if input == "h"
          player.add(deck.pop)
        elsif input == "s"
          break
        else
          puts "Input not valid"
        end
      end

      until dealer.score >= 17
        dealer.add(deck.pop)
      end

      if calculate_winner(player, dealer) == :player
        puts "You win"
      else
        puts "You lose"
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
