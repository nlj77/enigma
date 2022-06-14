require 'date'
class EncryptionGenerators

  def generate_key(seed = nil)
    if seed == nil
      seed= (0..5).to_a.sample(5).join
    end
    # key = Hash.new
    # keys["A"] = new_seed[0] + new_seed[1]
    # keys["B"] = new_seed[1] + new_seed[2]
    # keys["C"] = new_seed[2] + new_seed[4]
    # keys["D"] = new_seed[3] + new_seed[4]
    key = []
    key[0] = seed[0] + seed[1]
    key[1] = seed[1] + seed[2]
    key[2] = seed[2] + seed[3]
    key[3] = seed[3] + seed[4]
    return key
  end

  def generate_offsets(date)
    date_squared = date.to_i * date.to_i
    date_squared = date_squared.to_s
    new_offsets = date_squared[-4..-1]
    offsets = Hash.new
    offsets["A"] = new_offsets[0]
    offsets["B"] = new_offsets[1]
    offsets["C"] = new_offsets[2]
    offsets["D"] = new_offsets[3]
    return offsets
  end

  def generate_shifts(  date = Date.today.strftime("%-m%d%y"), key_seed)
    offsets = generate_offsets(date)
    offsets.transform_values!(&:to_i)
    shift_array = []
    key = generate_key(key_seed)
    shift_array[0] = key[0].to_i + offsets.values[0].to_i
    shift_array[1] = key[1].to_i + offsets.values[1].to_i
    shift_array[2] = key[2].to_i + offsets.values[2].to_i
    shift_array[3] = key[3].to_i + offsets.values[3].to_i
    return shift_array
  end
end
