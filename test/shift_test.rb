require_relative 'test_helper'
require './lib/shift'
require 'date'

class ShiftTest < Minitest::Test

  def setup
    @shift = Shift.new
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
    assert_equal "32551376400", @shift.squared_date
  end

  def test_it_can_extract_last_four_digits_from_squared_date
    assert_equal [6,4,0,0], @shift.last_four_digits
  end

  def test_itcan_assign_offset_to_variable
    expected = ({:A=> 6, :B=> 4, :C=> 0, :D=> 0})

    assert_equal expected, @shift.offsets
  end

  def test_it_can_determine_shift_amount
    assert_equal expected = ({:A=> 18, :B=> 27, :C=> 34, :D=> 45})
  end
end
