# frozen_string_literal: true

require 'rubygems'
require 'minitest/autorun'

# song 99 bottles of beer
class SongBottles
  def sing
    (1..100).reverse_each { |x| puts verse(x) }
  end

  def verse(number)
    start_verse = " #{number} bottles of beer on the wall,\n" \
    " #{number} bottles of beer!\n Take one down,\n Pass it around,\n"
    case number
    when 2
      start_verse + " #{number - 1} bottle of beer on the wall!\n\n"
    when 1
      " #{number} bottle of beer on the wall,\n" \
      " #{number} bottle of beer!\n Take it down,\n Pass it around,\n" \
      " No more bottles of beer on the wall!\n\n"
    else
      start_verse + " #{number - 1} bottles of beer on the wall!\n\n"
    end
  end
end

# test for SongBottles class
class SongBottlesTest < Minitest::Test
  def test_100_bottles_verse
    assert_equal  " 100 bottles of beer on the wall,\n" \
    " 100 bottles of beer!\n Take one down,\n Pass it around,\n" \
    " 99 bottles of beer on the wall!\n\n", SongBottles.new.verse(100)
  end

  def test_2_bottles_verse
    assert_equal " 2 bottles of beer on the wall,\n" \
    " 2 bottles of beer!\n Take one down,\n Pass it around,\n" \
    " 1 bottle of beer on the wall!\n\n", SongBottles.new.verse(2)
  end

  def test_1_bottle_verse
    assert_equal  " 1 bottle of beer on the wall,\n" \
    " 1 bottle of beer!\n Take it down,\n Pass it around,\n" \
    " No more bottles of beer on the wall!\n\n", SongBottles.new.verse(1)
  end
end

SongBottles.new.sing
