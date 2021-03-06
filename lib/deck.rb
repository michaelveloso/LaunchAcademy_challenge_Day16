require_relative 'card'

class Deck

  include Enumerable

  attr_reader :deck

  RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  SUITS = ['♠', '♣', '♥', '♦']

  def each(&block)
    @deck.each do |card|
      block.call(card)
    end
  end

  def initialize
    @deck = make_deck
  end

  def draw_card
    @deck.pop
  end

  private

  def make_deck
    deck = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        deck << Card.new(rank, suit)
      end
    end
    deck.shuffle!
  end

end
