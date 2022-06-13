require './lib/encryption_generators'
require 'rspec'

RSpec.describe EncryptionGenerators do
  it "exists" do
    encryption_generator = EncryptionGenerators.new
    expect(encryption_generator).to be_instance_of(EncryptionGenerators)
  end
  it "can return a hash of new keys with a length of five" do
    encryption_generator = EncryptionGenerators.new
    expect(encryption_generator.generate_key.length).to eq(4)
  end
  it "can return a hash of new offsets with a length of four" do
    encryption_generator = EncryptionGenerators.new
    expect(encryption_generator.generate_offsets(40895).length).to eq(4)
  end
  it "can return a array of shifts" do
    encryption_generator = EncryptionGenerators.new
    expect(encryption_generator.generate_shifts(40895).length).to eq(4)
  end
end
