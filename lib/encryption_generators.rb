class EncryptionGenerators

  def generate_keys
    new_seed = (0..5).to_a.sample(5).join
    keys = Hash.new
    keys["A"] = new_seed[0] + new_seed[1]
    keys["B"] = new_seed[1] + new_seed[2]
    keys["C"] = new_seed[2] + new_seed[4]
    keys["D"] = new_seed[3] + new_seed[4]
    return keys
  end

  def generate_offsets(date)
    date_squared = date * date
    date_squared = date_squared.to_s
    new_offsets = date_squared[-4..-1]
    offsets = Hash.new
    offsets["A"] = new_offsets[0]
    offsets["B"] = new_offsets[1]
    offsets["C"] = new_offsets[2]
    offsets["D"] = new_offsets[3]
    return offsets
  end
end
