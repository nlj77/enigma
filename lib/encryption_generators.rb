require 'date'
class EncryptionGenerators

  def generate_key
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

  def generate_shifts(  date = Date.today.strftime("%-m%d%y"), key = generate_key)
    offsets = generate_offsets(date)
    offsets.transform_values!(&:to_i)
    key.transform_values!(&:to_i)
    shift_array = offsets.values.map.with_index {|v, i| v + key.values[i]}
    return shift_array
  end
end
