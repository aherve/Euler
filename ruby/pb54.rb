#!/usr/bin/env ruby

module Poker
  def self.values
    (2..14)
  end

  def self.winning_hand(h1,h2)
    return 0 if h1.empty? or h2.empty? 
    new_h1 ,s1 = h1.score
    new_h2 ,s2 = h2.score

    return 1 if s1 > s2
    return 2 if s2 > s1
    return winning_hand(Hand.new(new_h1),Hand.new(new_h2))
  end
end

class Card
  attr_accessor :value, :type
  def initialize(str)
    v = str[0]
    if v == "T"
      @value = 10
    elsif v == "J"
      @value = 11
    elsif v == "Q"
      @value = 12
    elsif v == "K"
      @value = 13
    elsif v == "A"
      @value = 14
    else
      @value = v.to_i
    end
    @type  = str[1]
  end

  def to_s
    @value.to_s+@type.to_s
  end
end

class Hand 
  include Poker
  attr_accessor :cards

  def empty?
    @cards.empty?
  end

  def to_s
    @cards.map{|c| c.to_s}.join(",")
  end

  def score
    if    r = royal_flush? 
      s = 5000
    elsif r = straight_flush? 
      s = 4000 + r.sort_by(&:value).last
    elsif r = four_of_a_kind? 
      s = 3500 + r.first.value
    elsif r = full_house? 
      v1 = one_pair?.first.value
      v2 = three_of_a_kind?.first.value
      s = 3000 + (10*v2 + v1)
    elsif r = flush? 
      s = 2500 + high_card?.value
    elsif r = straight? 
      s = 2000 + (r.map(&:value).sort.last)
    elsif r = three_of_a_kind? 
      s = 1500 + (r.first.value)
    elsif r = two_pairs? 
      v1,v2 = r.map(&:value).sort
      s = 1000 +  (10*v2 + v1)
    elsif r = one_pair? 
      s = 500 + (r.first.value)
    else 
      r = high_card?
      s = high_card?.value
    end

    [@cards - [r].flatten, s]
  end

  def initialize(ary)
    @cards = ary.map{|c| c.is_a?(Card) ? c : Card.new(c)}
  end

  def royal_flush?
    return @cards if straight_flush? and @cards.map(&:value).max == Poker::values.max
  end

  def straight_flush?
    return @cards if straight? and @cards.map(&:type).uniq.size == 1
  end

  def four_of_a_kind?
    x_of_a_kind?(4)
  end

  def full_house?
    return @hand if three_of_a_kind? and Hand.new(@cards - three_of_a_kind?).one_pair?
    return nil
  end

  def flush?
    return @cards if @cards.map(&:type).uniq.size == 1
  end

  def straight?
    return @cards if (vs = @cards.map(&:value).sort) == (vs.min..vs.max).to_a
  end

  def three_of_a_kind?
    x_of_a_kind?(3)
  end

  def two_pairs?
    if (first_pair = one_pair?) and (second = Hand.new(@cards - one_pair?).one_pair?)
      return first_pair + second
    else
      return false
    end
  end

  def one_pair?
    x_of_a_kind?(2)
  end

  def high_card?
    @cards.sort_by{|c| c.value}.last
  end

  private
  def x_of_a_kind?(x)
    Poker::values.each do |v|
      if (ary = @cards.select{|c| c.value == v}).size == x
        return ary
      end
    end
    return false
  end
end


p File.open("./poker.txt").map { |line|
  a = line.split(/\W/)
  Poker::winning_hand(
    Hand.new(a[0..4]),
    Hand.new(a[5..9]),
  )
}
.select{|k| k == 1}
.reduce(:+)
