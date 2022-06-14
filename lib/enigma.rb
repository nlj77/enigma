require 'encryption_generators'

class Enigma

  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def encrypt(message, key, date)
    encryption_generator = EncryptionGenerators.new
    shift_array = encryption_generator.generate_shifts(date, key)
    shifts_index = 0
    encrypted_message = []
    message.each_char do |character|
      encrypted_character = shift_character(character, shift_array[shifts_index])
      shifts_index += 1
      if shifts_index > 3
        shifts_index = 0
      end
      encrypted_message << encrypted_character
    end
    encryption_hash = {}
    encryption_hash[:key] = key
    encryption_hash[:date] = date
    encryption_hash[:encryption] = encrypted_message.join
    return encryption_hash
  end

  def shift_character(character, shift_value)
    character = character.downcase
    index_number = @character_set.index(character)
    shifted_index = index_number + shift_value
    while shifted_index > (@character_set.length - 1)
      shifted_index -= (@character_set.length)
    end
    shifted_character = @character_set[shifted_index]
    return shifted_character
  end

  def reverse_shift_character(character, shift_value)
    character = character.downcase
    index_number = @character_set.index(character)
    shifted_index = index_number - shift_value
    while shifted_index < 0
      shifted_index += (@character_set.length)
    end
    shifted_character = @character_set[shifted_index]
    return shifted_character
  end

  def decrypt(encrypted_message, key, date)
    encryption_generator = EncryptionGenerators.new
    shift_array = encryption_generator.generate_shifts(date, key)
    shifts_index = 0
    decrypted_message = []
    encrypted_message.each_char do |character|
      decrypted_character = reverse_shift_character(character, shift_array[shifts_index])
      shifts_index += 1
      if shifts_index > 3
        shifts_index = 0
      end
      decrypted_message << decrypted_character
    end
    decryption_hash = {}
    decryption_hash[:key] = key
    decryption_hash[:date] = date
    decryption_hash[:decryption] = decrypted_message.join
    return decryption_hash
  end
end
