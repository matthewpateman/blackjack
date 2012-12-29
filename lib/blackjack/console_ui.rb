module Blackjack
  class ConsoleUI
    def display_welcome
      puts "Welcome to Blackjack"
    end
    
    def display_incorrect_input
      puts "Input not valid"
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
  end
end
