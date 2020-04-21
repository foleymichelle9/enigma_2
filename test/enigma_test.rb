require_relative 'test_helper'
require './lib/enigma'
require './lib/shift'
require 'date'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_encrypt
    expected = { encryption: 'zescf cfilk',
                 key: '12345',
                 date: '190420' }

    assert_equal expected, @enigma.encrypt('hello world', '12345', '190420')
  end

  def test_decrypt
   expected = { decryption: 'hello world',
                key: '12345',
                date: '190420' }

   assert_equal expected, @enigma.decrypt('zescf cfilk', '12345', '190420')
  end
end
