def dealer
  2.times do
  player_hand << game_deck.draw
  dealer_hand << game_deck.draw
  end
end

#could do player_hand[0] + player_hand[1]
def player_turn
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

game = Game.new
game.play
