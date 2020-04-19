require_relative 'test_helper'
require './lib/shift'
require 'date'

class ShiftTest < Minitest::Test

  def setup
    @shift = Shift.new
    @message = 'hi ruby!'
    @message2 = "hello World!"
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_attributes
    assert_instance_of String, @shift.key
    assert_equal 5, @shift.key.length
    assert_equal "12345", @shift.key
    assert_equal 6, @shift.date.length
  end

  def test_date_is_current

    expected = DateTime.now.strftime('%d%m%y').to_s
    assert_equal expected, @shift.date
  end

  def test_paired_keys
    assert_equal [12, 23, 34, 45], @shift.paired_keys
  end

  def test_it_can_assign_keys
    expected = ({ :A=> 12, :B=> 23, :C=> 34, :D=> 45 })

    assert_equal expected, @shift.assign_keys
  end

  def test_it_can_square_date
    assert_equal "36259776400", @shift.squared_date
  end

  def test_it_can_extract_last_four_digits_from_squared_date
    assert_equal [6,4,0,0], @shift.last_four_digits
  end

  def test_itcan_assign_offset_to_variable
    expected = ({:A=> 6, :B=> 4, :C=> 0, :D=> 0})

    assert_equal expected, @shift.offsets
  end

  def test_it_can_determine_shift_amount
    expected = ({:A=> 18, :B=> 27, :C=> 34, :D=> 45})
    assert_equal expected, @shift.shift_amount
  end

  def test_it_can_split_alphabet
     expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

     assert_equal expected, @shift.alphabet
  end

  def test_it_can_split_up_message
    @message = 'Hi Ruby!'

    assert_equal ['h','i',' ','r','u','b','y','!'], @shift.split_message(@message)
  end

  def test_it_can_shift_message_amount_by_shift_amount
    assert_equal [18,27,34,45,18,27,34,45], @shift.shift_message(@message)
  end

  def test_it_can_shift_alphabet_by_shift_amount
    expected = [["s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r"],
                ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "],
                ["h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g"],
                ["s", "t", "u", "v", "w", "x", "y", "z", " ", "a","b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r"],
                ["s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r"],
                ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "],
                ["h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g"],
                ["s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r"]]

    assert_equal expected, @shift.shifted_alphabet(@message)
  end

  def test_it_can_shift_message
      assert_equal "zigilbe!", @shift.shifted_message(@message)
      assert_equal "zescf cfilk!", @shift.shifted_message(@message2)
  end

  def test_it_can_unshift_message
    message = "zigilbe!"
    assert_equal "hi ruby!", @shift.unshifted_message(message)
  end
end
