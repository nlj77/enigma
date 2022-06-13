require './lib/key_generator'
require 'rspec'

RSpec.describe KeyGenerator do
  it "exists" do
    key_generator = KeyGenerator.new
    expect(key_generator).to be_instance_of(KeyGenerator)
  end
  it "can return a hash of new keys with a length of five" do
    key_generator = KeyGenerator.new
    expect(key_generator.generate.length).to eq(4)
  end
end
