require_relative "../../lib/deck"

describe Deck do

  let (:deck) {Deck.new}
  describe "#initialization" do
    it "should be sufficiently random" do
      expect((deck.deck == deck.deck.sort_by{|card|card.rank})).to eql(false)
      expect((deck.deck == deck.deck.sort_by{|card|card.suit})).to eql(false)
      expect((deck.deck == deck.deck.sort_by{|card|[card.suit, card.rank]})).to eql(false)
      expect((deck.deck == deck.deck.sort_by{|card|[card.rank, card.suit]})).to eql(false)
    end

    it "should make 52 cards" do
      expect(deck.deck.size).to eql(52)
    end
  end

  describe "#draw_card" do
    it "should produce a card" do
      expect(deck.draw_card).to be_a(Card)
    end

    it "should produce a unique card" do
      card = deck.draw_card
      expect(deck.deck.include?(card)).to eql(false)
    end

    it "should remove cards from the deck" do
      deck.draw_card
      expect(deck.deck.size).to eql(51)
      deck.draw_card
      expect(deck.deck.size).to eql(50)
    end

  end

end
