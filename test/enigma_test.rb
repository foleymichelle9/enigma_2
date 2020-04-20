require_relative 'test_helper'
require './lib/enigma'
require './lib/shift'
require 'date'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_encrypt
    enigma = Enigma.new
    expected = { encryption: 'zescf cfilk',
                 key: '12345',
                 date: '190420' }

    assert_equal expected, enigma.encrypt('hello world', '12345', '190420')
  end
end
