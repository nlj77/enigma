require 'time'
require_relative './encryption_generator'
require_relative './enigma'

enigma = Enigma.new
message_text = ARGV[0]
encrypted_text = ARGV[1]

message = File.new(message_text).read

ile.open(encrypted_text, "w") do |text_file|
  enigma.encrypt(message)
  text_file.puts enigma.encrypted_hash[:encryption]
  puts "Created #{encrypted_text} with the key #{enigma.encrypted_hash[:key]} and date #{enigma.encrypted_hash[:date]}."
end
