require './lib/encryption_generators'
require 'rspec'

RSpec.describe EncryptionGenerators do
  it "exists" do
    encryption_generator = EncryptionGenerators.new
    expect(key_generator).to be_instance_of(EncryptionGenerators)
  end
  it "can return a hash of new keys with a length of five" do
    encryption_generator = EncryptionGenerators.new
    expect(encryption_generator.generate_keys.length).to eq(4)
  end
end
