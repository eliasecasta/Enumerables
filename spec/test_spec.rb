require_relative '../main.rb'

describe Enumerable do
  describe '#my_each' do
    it 'return an array' do
      expect([1, 1, 1].my_all?(1)).to eq([1, 1, 1].all?(1))
    end
  end
  # describe '#my_count' do
  #   it 'return a array' do
  #     expect([1, 2, 3].my_count).to eq([1, 2, 3].size)
  #   end
  # end

  describe '#my_select' do
    it 'my_select should return odd array' do
      expect([1, 2, 3, 8].my_select(&:odd?)).to eq([1, 3])
    end
  end

  describe '#my_select' do
    it 'my_select should return even array' do
      expect([1, 2, 3, 8].my_select(&:even?)).to eq([2, 8])
    end
  end

  describe '#my_all' do
    it 'my_all should return true on odd array' do
      expect([3, 5, 7, 11].my_all?(&:odd?)).to eq(true)
    end
  end

  describe '#my_all' do
    it 'my_all should return true if all values are neagtive' do
      expect([-8, -9, -6].my_all? { |n| n < 0 }).to eq(true)
    end
  end

  describe '#my_all' do
    it 'my_all should return true if all values are neagtive' do
      expect([-8, -9, -6].my_all? { |n| n < 0 }).to eq(true)
    end
  end

  describe '#my_any' do
    it 'my_any should return true if values are even' do
      expect([7, 10, 3, 5].my_any?(&:even?)).to eq(true)
    end
  end

  describe '#my_any' do
    it 'my_any should return true if all charecters are in string' do
      expect(%w[q r s i].my_any? { |char| 'aeiou'.include?(char) }).to eq(true)
    end
  end

  describe '#my_any' do
    it 'my_any should return false if numbers in array not even' do
      expect([7, 11, 3, 5].my_any?(&:even?)).to eq(false)
    end
  end

  describe '#my_any' do
    it 'my_any should return false if char are not in string' do
      expect(%w[q r s t].my_any? { |char| 'aeiou'.include?(char) }).to eq(false)
    end
  end

  describe '#my_any' do
    it 'my_any should return true' do
      expect([1, nil, false].my_any?(1)).to eq(true)
    end
  end

  describe '#my_any' do
    it 'my_any should return true if there a integer in array' do
      expect([1, nil, false].my_any?(Integer)).to eq(true)
    end
  end
  describe '#my_any' do
    it 'my_any should return false if a charecter is not found in any elememt' do
      expect(%w[dog door rod blade].my_any?(/z/)).to eq(false)
    end
  end

  describe '#my_any' do
    it 'my_any should return true if 1 is found in array' do
      expect([1, 2, 3].my_any?(1)).to eq(true)
    end
  end

  describe '#my_any' do
    it 'my_any should return true if elements are Numeric in array' do
      expect([1, 2, 3].my_any?(Numeric)).to eq(true)
    end
  end

  describe '#my_any' do
    it 'my_any should return true if elements are Integer in array' do
      expect([1, 2, 3].my_any?(Integer)).to eq(true)
    end
  end

  describe '#my_any' do
    it 'my_any should return false if element is found' do
      expect(%w[jes,umair,jesagain,hello].my_any?('jes')).to eq(false)
    end
  end
end
