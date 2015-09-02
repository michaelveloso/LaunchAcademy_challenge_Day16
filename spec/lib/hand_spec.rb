require_relative "../../lib/hand"
require_relative "../../lib/card"

describe Hand do

  let (:player_hand) {Hand.new("Player")}
  let (:dealer_hand) {Hand.new("Dealer")}
  let (:cardTS) {Card.new('T', '♠')}
  let (:card4D) {Card.new('4', '♦')}
  let (:card7H) {Card.new('7', '♥')}
  let (:card5S) {Card.new('5', '♠')}
  let (:cardKC) {Card.new('K', '♣')}
  let (:cardAH) {Card.new('A', '♥')}
  let (:cardJD) {Card.new('J', '♦')}
  let (:cardQH) {Card.new('Q', '♥')}

  describe "#initialization" do
    it "is a hand" do
      expect(player_hand).to be_a(Hand)
    end

    it "tells us about its owner" do
      expect(player_hand.owner).to eq("Player")
      expect(dealer_hand.owner).to eq("Dealer")
    end

    it "tells us about its cards" do
      test_cards = [cardTS, card4D]
      test_hand = Hand.new("Test", test_cards)
      expect(player_hand.cards).to eq([])
      expect(dealer_hand.cards).to eq([])
      expect(test_hand.cards).to eq(test_cards)
    end
  end

  describe "#score" do
    it "adds numbered ranks correctly" do
      test_cards = [card4D, card7H]
      test_hand = Hand.new("Test", test_cards)
      expect(test_hand.score).to eq(11)
    end

    it "adds face cards correctly" do
      test_cards_1 = [cardJD, cardKC]
      test_hand_1 = Hand.new("Test1", test_cards_1)
      test_cards_2 = [cardQH, card4D]
      test_hand_2 = Hand.new("Test2", test_cards_2)
      expect(test_hand_1.score).to eq(20)
      expect(test_hand_2.score).to eq(14)
    end

    it "adds aces correctly" do
      test_cards_1 = [cardAH, cardAH]
      test_cards_2 = [cardAH, cardAH, cardAH]
      test_cards_3 = [cardAH, cardAH, cardAH, cardAH]
      test_cards_4 = [cardTS, cardJD, cardAH]
      test_cards_5 = [card4D, cardAH]
      test_hand_1 = Hand.new("Test1", test_cards_1)
      test_hand_2 = Hand.new("Test2", test_cards_2)
      test_hand_3 = Hand.new("Test3", test_cards_3)
      test_hand_4 = Hand.new("Test4", test_cards_4)
      test_hand_5 = Hand.new("Test5", test_cards_5)
      expect(test_hand_1.score).to eq(12)
      expect(test_hand_2.score).to eq(13)
      expect(test_hand_3.score).to eq(14)
      expect(test_hand_4.score).to eq(21)
      expect(test_hand_5.score).to eq(15)
    end
  end

  describe "#blackjack?" do

    it "correctly identifies blackjack" do
      test_cards_1 = [cardAH, cardJD]
      test_hand_1 = Hand.new("Test1", test_cards_1)
      expect(test_hand_1.blackjack?).to eq(true)
    end

    it "doesn't report false positives" do
      test_cards_2 = [cardKC, card7H]
      test_hand_2 = Hand.new("Test2", test_cards_2)
      expect(test_hand_2.blackjack?).to eq(false)
    end

  end

  describe "bust?" do

    it "correctly identifies busts" do
      test_cards_1 = [cardJD, cardQH, card7H]
      test_hand_1 = Hand.new("test1", test_cards_1)
      expect(test_hand_1.bust?).to eq(true)
    end

    it "doesn't report false positives" do
      test_cards_1 = [card4D, cardAH]
      test_hand_1 = Hand.new("test1", test_cards_1)
      expect(test_hand_1.bust?).to eq(false)
    end

  end

  describe "to_s" do
    it "returns a string" do
      expect(player_hand.to_s).to be_a(String)
      expect(dealer_hand.to_s).to be_a(String)
    end

    it "returns a string comprised of ranks and suits for each card" do
      test_cards_1 = [card4D, cardAH]
      test_cards_2 = [cardJD, cardQH, card7H]
      test_hand_1 = Hand.new("test1", test_cards_1)
      test_hand_2 = Hand.new("test2", test_cards_2)
      expect(test_hand_1.to_s).to eq("4♦ A♥")
      expect(test_hand_2.to_s).to eq("J♦ Q♥ 7♥")
    end
  end
end
