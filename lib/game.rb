require_relative 'deck'
require_relative 'card'
require_relative 'hand'

class Game

  attr_accessor :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Hand.new("Player")
    @dealer = Hand.new("Dealer")
  end

  def play
    player_result = turn(player)
    if player_result == :blackjack
      puts "Blackjack!"
    elsif player_result == :bust
      puts "Bust! You lose..."
    else
      dealer_result = turn(dealer)
      if dealer_result == :blackjack
        puts "Dealer gets Blackjack! You lose."
      elsif dealer_result == :bust
        puts "Dealer busts. You win!"
      else
        puts winner
      end
    end
  end

  private

  def turn(hand)
    make_starting_hand(hand)
    if hand.blackjack?
      return :blackjack
    else
      if hand.owner == "Player"
        player_draw
      else
        dealer_draw
      end
    end
  end

  def player_draw
    while player_hit?
      draw_card(player)
      if player.bust?
        return :bust
      end
    end
    :stand
  end

  def player_hit?
    while true
      print "Hit or stand: (H/S): "
      answer = gets.chomp.downcase
      puts
      if ['s','h'].include?(answer)
        break
      else
        puts "Invalid input."
        puts
      end
    end
    answer == 'h'
  end

  def dealer_draw
    while dealer.score < 17
      puts "Dealer hits."
      draw_card(dealer)
      if dealer.bust?
        return :bust
      end
    end
    :stand
  end

  def winner
    if dealer.score < player.score
      "Player wins!"
    elsif player.score < dealer.score
      "Dealer wins."
    else
      "Push."
    end
  end

  def make_starting_hand (hand)
    draw_card(hand, false)
    draw_card(hand)
  end

  def draw_card(hand, score = true)
    card_to_add = deck.draw_card
    hand.add_card(card_to_add)
    puts "#{hand.owner} was dealt #{card_to_add}"
    if score
      puts "#{hand.owner} hand: #{hand.to_s}"
      puts "#{hand.owner} score: #{hand.score}"
      puts
    end
  end

end
