require './lib/enigma'
require 'rspec'

RSpec.describe Enigma do

  it "exists" do
  enigma = Enigma.new
  expect(enigma).to be_instance_of(Enigma)
  end
end
