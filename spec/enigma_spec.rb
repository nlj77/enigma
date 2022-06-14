require './lib/enigma'
require 'rspec'

RSpec.describe Enigma do

  it "exists" do
  enigma = Enigma.new
  expect(enigma).to be_instance_of(Enigma)
  end

  it "can return an encryption hash" do
    enigma = Enigma.new
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq({
    encryption: "keder ohulw",
    key: "02715",
    date: "040895"})
  end

  it "can shift a character" do
    enigma = Enigma.new
    expect(enigma.shift_character("A", 5)).to eq("f")
    expect(enigma.shift_character("Z", 2)).to eq("a")
    expect(enigma.shift_character("Z", 29)).to eq("a")
  end

  it "can decrypt a message" do
    enigma = Enigma.new
    expect(enigma.decrypt("keder ohulw","02715","040895")).to eq({
    decryption: "hello world",
    key: "02715",
    date: "040895"})
  end
end
