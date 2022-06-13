require 'encryption_generators'

class Enigma

  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def encrypt(message, key, date)
    encryption_generator = EncryptionGenerators.new
    encryption_generator.generate_shifts(date, key)
  end

end
