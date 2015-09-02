class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def face_card?
    ['J', 'Q', 'K'].include?(rank)
  end

  def ace?
    rank == 'A'
  end

  def value
    if face_card?
      10
    elsif ace?
      1
    else
      rank.to_i
    end
  end

  def to_s
    "#{rank}#{suit}"
  end

end
