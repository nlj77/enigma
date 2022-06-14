require 'time'
require_relative './encryption_generator'
require_relative './enigma'

enigma = Enigma.new
message_text = ARGV[0]
