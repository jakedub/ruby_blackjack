require_relative 'card'
#above points to the card.rb file in the same directory

class Deck
  attr_accessor :card_holder

  def initialize
    create_deck
    shuffle_cards
  end

# cretes a shuffled deck of cards in array
  def create_deck
    self.card_holder = []
    Card.faces.each do |face|
      Card.suits.each do |suit|
        card_holder << Card.new(face, suit)
      end
    end

#randomize the cards
    def shuffle_cards
      card_holder.shuffle!
    end

#mutates the deck by taking out the first in the array
    def draw
      card_holder.shift
    end

  end
