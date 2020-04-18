require_relative 'test_helper'
require './lib/cipher'
require 'date'

class CipherTest < Minitest::Test

  def setup
    @cipher = Cipher.new
  end

  def test_it_exists
    assert_instance_of Cipher, @cipher
  end

  def test_attributes
    assert_instance_of String, @cipher.key
    assert_equal 5, @cipher.key.length
    assert_equal 6, @cipher.date.length
  end
end
