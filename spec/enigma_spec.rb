require './lib/enigma'
require 'rspec'

RSpec.describe Enigma do

  it "exists" do
  enigma = Enigma.new
  expect(enigma).to be_instance_of(Enigma)
  end

  xit "can return an encryption hash" do
    enigma = Enigma.new
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq({
    encryption: "keder ohulw",
    key: "02715",
    date: "040895"})
  end
end
