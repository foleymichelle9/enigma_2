require_relative './enigma'
require_relative './shift'
require 'date'


enigma = Enigma.new
shift = Shift.new
handle = File.open(ARGV[0], "r")
message_text = handle.read
handle.close
