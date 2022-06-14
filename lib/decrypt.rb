require 'time'
require_relative './encryption_generator'
require_relative './enigma'

enigma = Enigma.new
message_text = ARGV[0]
decrypted_text = ARGV[1]

message = File.new(message_text).read

File.open(decrypted_text, "w") do |text_file|
  enigma.decrypt(message)
  text_file.puts enigma.decrypted_hash[:decryption]
