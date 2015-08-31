class Hand

  attr_accessor :cards, :owner

  def initialize(owner, cards = [])
    @owner = owner
    @cards = cards
  end

  def score
    score = 0
    cards.each do |card|
      score += card.value
    end
    if cards.any?{|card| card.ace?}
      score += 10 if score < 12
    end
    score
  end

  def add_card(card)
    cards << card
  end

  def blackjack?
    cards.any?{|card| card.ace?} && cards.any?{|card| card.face_card?}
  end

  def bust?
    score > 21
  end

  def to_s
    hand_string = ""
    cards.each do |card|
      hand_string << "#{card} "
    end
    hand_string.strip
  end

end
