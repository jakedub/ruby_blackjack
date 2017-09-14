require 'pry'
require_relative 'deck'
require_relative 'card'

class Game
  attr_accessor :player_hand, :dealer_hand, :game_deck, :money, :first_game, :hit_phase

  def initialize
    self.player_hand = []
    self.dealer_hand = []
    game_deck = Deck.new
    money = 100
  end

  def play

    def dealer
      2.times do
        player_hand << game_deck.draw
        dealer_hand << game_deck.draw
        puts player_hand
        puts dealer_hand
      end
    end
    #could do player_hand[0] + player_hand[1]
    def player_hand
      hand_value = player_hand.reduce(:+)
      puts "You have #{hand_value}"
      player_hand.each do |card|
        puts card
      end

      puts "Hit(y) or Stay(n)"
      answer = gets.chomp.downcase
      if answer == "y"
        player_hand << game_deck.draw
        hit_phase (player)
      end

      def dealer_hand
        puts "Dealer's Turn. Showing #{dealer_hand[0]}"
        dealer_value = dealer_hand.reduce(:+)
        if dealer_value < 16
          hit_phase (dealer)
        end
      end

      def hit_phase (who)
        player_hand << game_deck.draw
        who_turn

        dealer_hand << game_deck.draw
        who_turn
      end

      def show_hands
        #player_hand "has these cards with this total" dealer_hand "has these cards with this total"
      end

      def winner
        #output winner, win get $10, lose lose $10
        if win
          money += 10
        else loss
          money -= 10
          puts "You now have #{money} dollars"
        end

        def rematach
        end

      end
    end


game = Game.new
game.play

binding.pry
