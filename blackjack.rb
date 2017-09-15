require 'pry'
require_relative 'deck'
require_relative 'card'

class Game
  attr_accessor :player_hand, :dealer_hand, :game_deck, :money, :first_game, :hit_phase, :player_final, :dealer_final

  def initialize
    self.player_hand = []
    self.dealer_hand = []
    self.game_deck = Deck.new
    self.money = 100
    self.first_game = true
    self.player_final = []
    self.dealer_final = []
  end

  def play
    start
    player_turn
    dealer_turn
    show_hands
    winner
    rematch
  end

def start
    if first_game == true
    2.times do
      player_hand << game_deck.draw
      dealer_hand << game_deck.draw
    end
    puts "Welcome to Blackjack"
    puts "Player hand is:"
    puts player_hand
    puts "Dealer hand is:"
    puts dealer_hand
    else
    self.money -=10
    puts money
    puts "Welcome back jerk"
    2.times do
      player_hand << game_deck.draw
      dealer_hand << game_deck.draw
    end
    puts "Player hand is:"
    puts player_hand
    puts "Dealer hand is:"
    puts dealer_hand
end
end

  # def start
  #   if first_game == true
  #     puts "Welcome to Blackjack!"
  #   end
  #   self.money -= 10
  #   puts money
  #   2.times do
  #     player_hand << game_deck.draw
  #     dealer_hand << game_deck.draw
  #   end
  #   puts "Player hand is:"
  #   puts player_hand
  #   puts "Dealer hand is:"
  #   puts dealer_hand
  # end

  #could do player_hand[0] + player_hand[1]
  def player_turn
    hand_value = player_hand.reduce(:+)
    puts "You have #{hand_value}"
    player_hand.each do |card|
      puts card
    end

    puts "Hit or Stay, yes or no"
    answer = gets.chomp.downcase
    if answer == "yes"
      player_hand << game_deck.draw
      hit_phase (player)
    else
      player_final << player_hand
    end
    puts hand_value
  end

#reveals first card in hand but also total value in the puts
  def dealer_turn
    puts "Dealer's Turn. Showing #{dealer_hand[0]}"
    dealer_value = dealer_hand.reduce(:+)
    if dealer_value < 16
      hit_phase (dealer)
    else
      dealer_final << dealer_hand
    end
    puts dealer_value
  end

  def hit_phase(who)
    who_turn_hand << game_deck.draw
    who_turn
  end

  # def final_player
  #   player_final << player_hand
  #   player_final_value = player_hand.reduce(:+)
  #   puts player_final_value
  # end
  #
  # def final_dealer
  #   dealer_final_value = dealer_hand.reduce(:+)
  #   puts dealer_final_value
  # end

  def show_hands
    player_final_value = player_hand.reduce(:+)
    dealer_final_value = dealer_hand.reduce(:+)
    puts "Player has a total of #{player_final_value}. Dealer has a total of #{dealer_final_value}"
    if player_final_value > dealer_final_value
      puts "You win, congrats on beating a program built by a novice."
    else
      puts "I have bested you."
    end
  end

  def winner
    player_final_value = player_hand.reduce(:+)
    dealer_final_value = dealer_hand.reduce(:+)
    win = player_final_value > dealer_final_value
    if win
      self.money += 10
      puts "Here's the #{money} dollars"
    else
      self.money -= 10
      puts "You now have #{money} dollars"
    end
  end

  def rematch
    puts "Do you want to play again? Y/N"
    answer = gets.chomp.downcase
    if answer == "y"
      first_game == false
      self.player_hand = []
      self.dealer_hand = []
      start
    else
      puts "Fine I don't like you anyway"
    end
  end

end


game = Game.new
binding.pry
