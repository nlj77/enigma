class KeyGenerator

  def generate
    new_seed = (0..5).to_a.sample(5).join
    keys = Hash.new
    keys["A"] = new_seed[0] + new_seed[1]
    keys["B"] = new_seed[1] + new_seed[2]
    keys["C"] = new_seed[2] + new_seed[4]
    keys["D"] = new_seed[3] + new_seed[4]
    return keys
  end
end
