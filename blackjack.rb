require "pry"

class Card

  attr_reader :suit, :value, :face

  def initialize  x, suit
    @face = x
    @suit = suit
    @drawn = []
  end

  def value
    if @face == :K || @face == :Q || @face == :J
      10
    elsif @face == :A
      11
    else
      @face
    end
  end
end

class Deck

  attr_reader :cards, :drawn

  def initialize
    @cards = (1..52).to_a
    @drawn = []
  end

  def draw
    @cards.shuffle!
    drawn.push(@cards.pop).last
  end

end

class Hand

  attr_reader :value

  def initialize
    @in_hand =[]
  end

  def add *cards
    cards.each do |x|
      if (x).nil? == false
        @in_hand.push(x)
      end
    end
    @in_hand
  end

  def value
    total = 0
    @in_hand.each do |x|
      total += x.value
    end

    if total > 21
      @in_hand.each do |x|
        if x.value == 11
          total -= 10
        end
      end
    end
    total
  end

  def busted?
    total = 0
    @in_hand.each do |x|
      total += x.value
    end
    unless total < 22
      true
    else
      false
    end
  end

  def blackjack?
    @in_hand.each do |x|
      if x.suit == :S
        true
      else
        false
      end
    end
  end

  def to_s
    string = []

    @in_hand.each do |x|
      string.push("#{x.face}#{x.suit}")
    end

    string.join ", "
  end



end
