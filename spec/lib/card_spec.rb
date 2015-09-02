require_relative "../../lib/card"

describe Card do

  let (:cardTS) {Card.new('10', '♠')}
  let (:card4D) {Card.new('4', '♦')}
  let (:cardKC) {Card.new('K', '♣')}
  let (:cardAH) {Card.new('A', '♥')}
  let (:cardJD) {Card.new('J', '♦')}
  let (:cardQH) {Card.new('Q', '♥')}

  describe "#initialization" do

    it 'should make a Card instance' do
      expect(cardTS).to be_a(Card)
    end

    it 'should retain its rank' do
      expect(cardKC.rank).to eq('K')
      expect(card4D.rank).to eq('4')
    end

    it 'should retain its suit' do
      expect(cardTS.suit).to eq('♠')
      expect(card4D.suit).to eq('♦')
    end
  end

  describe "#face_card?" do

    it "shouldn't consider a number a face card" do
      expect(card4D.face_card?).to eq(false)
    end

    it "shouldn't consider an ace a face card" do
      expect(cardAH.face_card?).to eq(false)
    end

    it "should consider a jack, queen, or king a face card" do
      expect(cardKC.face_card?).to eq(true)
      expect(cardQH.face_card?).to eq(true)
      expect(cardJD.face_card?).to eq(true)
    end

  end

  describe "#ace?" do

    it "shouldn't consider a number an ace" do
      expect(card4D.ace?).to eq(false)
    end

    it "shouldn't consider a king, queen, or jack an ace" do
      expect(cardJD.ace?).to eq(false)
      expect(cardQH.ace?).to eq(false)
      expect(cardKC.ace?).to eq(false)
    end

    it "should consider an ace to be an ace" do
      expect(cardAH.ace?).to eq(true)
    end

  end

  describe "#value" do

    it "should return a number's value as that number" do
      expect(card4D.value).to eq(4)
      expect(cardTS.value).to eq(10)

    end

    it "should return a face card's value as 10" do
      expect(cardJD.value).to eq(10)
      expect(cardQH.value).to eq(10)
      expect(cardKC.value).to eq(10)
    end

    it "should return an ace's value as 1" do
      expect(cardAH.value).to eq(1)
    end
  end

  describe "#to_s" do
    it "should return a card's rank and suit munged together" do
      expect(card4D.to_s).to eq('4♦')
      expect(cardAH.to_s).to eq('A♥')
      expect(cardKC.to_s).to eq('K♣')
      expect(cardTS.to_s).to eq('10♠')
    end
  end
end
