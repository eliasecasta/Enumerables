require_relative '../main.rb'

describe Enumerable do
  describe '#my_each' do
    it 'return an array' do
      expect([1, 1, 1].my_all?(1)).to eq([1, 1, 1].all?(1))
    end
  end
  describe '#my_count' do
    it 'return a array' do
      expect([1,2,3].my_count).to eq([1,2,3].count)
    end
  end

end
