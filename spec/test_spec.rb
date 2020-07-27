# rubocop:disable Metrics/LineLength
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

  describe '#my_each_with_index' do
    it 'return the array values' do
      expect([1, 2, 3].my_each_with_index { |elem, idx| puts "#{elem} : #{idx}" }).to eq([1, 2, 3].each_with_index { |elem, idx| puts "#{elem} : #{idx}" })
    end
  end

  describe '#my_select' do
    it 'my_select should return odd array' do
      expect([1, 2, 3, 8].my_select(&:odd?)).to eq([1, 2, 3, 8].select(&:odd?))
    end
  end

  describe '#my_select' do
    it 'my_select should return even array' do
      expect([1, 2, 3, 8].my_select(&:even?)).to eq([1, 2, 3, 8].select(&:even?))
    end
  end

  describe '#my_all' do
    it 'my_all should return true on odd array' do
      expect([3, 5, 7, 11].my_all?(&:odd?)).to eq([3, 5, 7, 11].all?(&:odd?))
    end
  end

  describe '#my_all' do
    it 'my_all should return true if all values are neagtive' do
      expect([-8, -9, -6].my_all? { |n| n < 0 }).to eq([-8, -9, -6].all? { |n| n < 0 })
    end
  end

  describe '#my_all' do
    it 'my_all should return true if all values are neagtive' do
      expect([-8, -9, -6].my_all? { |n| n < 0 }).to eq([-8, -9, -6].all? { |n| n < 0 })
    end
  end

  describe '#my_any' do
    it 'my_any should return true if values are even' do
      expect([7, 10, 3, 5].my_any?(&:even?)).to eq([7, 10, 3, 5].any?(&:even?))
    end
  end

  describe '#my_any' do
    it 'my_any should return true if all charecters are in string' do
      expect(%w[q r s i].my_any? { |char| 'aeiou'.include?(char) }).to eq(%w[q r s i].any? { |char| 'aeiou'.include?(char) })
    end
  end

  describe '#my_any' do
    it 'my_any should return false if numbers in array not even' do
      expect([7, 11, 3, 5].my_any?(&:even?)).to eq([7, 11, 3, 5].any?(&:even?))
    end
  end

  describe '#my_any' do
    it 'my_any should return false if char are not in string' do
      expect(%w[q r s t].my_any? { |char| 'aeiou'.include?(char) }).to eq(%w[q r s t].any? { |char| 'aeiou'.include?(char) })
    end
  end

  describe '#my_any' do
    it 'my_any should return true' do
      expect([1, nil, false].my_any?(1)).to eq([1, nil, false].any?(1))
    end
  end

  describe '#my_any' do
    it 'my_any should return true if there a integer in array' do
      expect([1, nil, false].my_any?(Integer)).to eq([1, nil, false].any?(Integer))
    end
  end
  describe '#my_any' do
    it 'my_any should return false if a charecter is not found in any elememt' do
      expect(%w[dog door rod blade].my_any?(/z/)).to eq(%w[dog door rod blade].any?(/z/))
    end
  end

  describe '#my_any' do
    it 'my_any should return true if 1 is found in array' do
      expect([1, 2, 3].my_any?(1)).to eq([1, 2, 3].any?(1))
    end
  end

  describe '#my_any' do
    it 'my_any should return true if elements are Numeric in array' do
      expect([1, 2, 3].my_any?(Numeric)).to eq([1, 2, 3].any?(Numeric))
    end
  end

  describe '#my_any' do
    it 'my_any should return true if elements are Integer in array' do
      expect([1, 2, 3].my_any?(Integer)).to eq([1, 2, 3].any?(Integer))
    end
  end

  describe '#my_any' do
    it 'my_any should return false if element is found' do
      expect(%w[jes,umair,jesagain,hello].my_any?('jes')).to eq(%w[jes,umair,jesagain,hello].any?('jes'))
    end
  end

  describe '#my_none' do
    it 'my_none should return true if the elements are even ' do
      expect([7, 10, 3, 5].my_none?(&:even?)).to eq([7, 10, 3, 5].none?(&:even?))
    end
  end

  describe '#my_none' do
    it 'my_none should return true if a charecter is not found in a element of array ' do
      expect(%w[sushi pizza burrito].my_none? { |word| word[0] == 'a' }).to eq(%w[sushi pizza burrito].none? { |word| word[0] == 'a' })
    end
  end

  describe '#my_none' do
    it 'my_none should return true if the elements are not even  ' do
      expect([3, 5, 4, 7, 11].my_none?(&:even?)).to eq([3, 5, 4, 7, 11].none?(&:even?))
    end
  end

  describe '#my_none' do
    it 'my_none should return false if every element is not starting with a ' do
      expect(%w[asparagus sushi pizza apple burrito].my_none? { |word| word[0] == 'a' }).to eq(%w[asparagus sushi pizza apple burrito].none? { |word| word[0] == 'a' })
    end
  end

  describe '#my_none' do
    it 'my_none should return false if every element is not starting with a ' do
      expect([nil, false, nil, false].my_none?).to eq([nil, false, nil, false].none?)
    end
  end

  describe '#my_none' do
    it 'my_none should return false beacuse  array is not none ' do
      expect([1, 2, 3].my_none?).to eq([1, 2, 3].none?)
    end
  end

  describe '#my_none' do
    it 'my_none should return true beacuse  array are string ' do
      expect([1, 2, 3].my_none?(String)).to eq([1, 2, 3].none?(String))
    end
  end

  describe '#my_none' do
    it 'my_none should return false beacuse there is 2 in array' do
      expect([1, 2, 3, 4, 5].my_none?(2)).to eq([1, 2, 3, 4, 5].none?(2))
    end
  end

  describe '#my_none' do
    it 'my_none should return true because there is no 4 four in array' do
      expect([1, 2, 3].my_none?(4)).to eq([1, 2, 3].my_none?(4))
    end
  end

  describe '#my_count' do
    it 'my_count should return count of even numbers' do
      expect([1, 4, 3, 8].my_count(&:even?)).to eq([1, 4, 3, 8].count(&:even?))
    end
  end

  describe '#my_count' do
    it 'my_count should return count of uper case elements' do
      expect(%w[DANIEL JIA KRITI dave].my_count { |s| s == s.upcase }).to eq(%w[DANIEL JIA KRITI dave].count { |s| s == s.upcase })
    end
  end

  describe '#my_count' do
    it 'my_count should return count of uper case elements' do
      expect(%w[DANIEL JIA KRITI dave].my_count { |s| s == s.upcase }).to eq(%w[DANIEL JIA KRITI dave].count { |s| s == s.upcase })
    end
  end

  describe '#my_count' do
    it 'my_count should return count 1 in array' do
      expect([1, 1, 1, 2, 3].my_count(1)).to eq([1, 1, 1, 2, 3].count(1))
    end
  end

  describe '#my_count' do
    it 'my_count should return elements from 1 to 5' do
      expect((1...5).my_count).to eq((1...5).count)
    end
  end

  describe '#my_map' do
    it 'my_map should return an array of multiply for 2' do
      expect([1, 2, 3].my_map { |n| 2 * n }).to eq([1, 2, 3].map { |n| 2 * n })
    end
  end

  describe '#my_map' do
    it 'my_map should return an array with concat of ?' do
      expect(%w[Hey Jude].my_map { |word| word + '?' }).to eq(%w[Hey Jude].map { |word| word + '?' })
    end
  end

  describe '#my_map' do
    it 'my_map should return with not operation' do
      expect([false, true].my_map(&:!)).to eq([false, true].map(&:!))
    end
  end

  describe '#my_map' do
    it 'my_map should return true for less than 10 element and false than grater than 10 element' do
      expect([18, 22, 5, 6] .my_map(my_proc) { |num| num < 10 }).to eq([18, 22, 5, 6] .map(my_proc) { |num| num < 10 })
    end
  end

  describe '#my_inject' do
    it 'my_inject will return the the array + 10' do
      expect([1, 2, 3, 4].my_inject(10) { |accum, elem| accum + elem }).to eq([1, 2, 3, 4].inject(10) { |accum, elem| accum + elem })
    end
  end

  describe '#my_inject' do
    it 'my_inject will return the sum of array' do
      expect([1, 2, 3, 4].my_inject { |accum, elem| accum + elem }).to eq([1, 2, 3, 4].inject { |accum, elem| accum + elem })
    end
  end
  describe '#my_inject' do
    it 'my_inject will return the sum of array with + symbol' do
      expect([1, 2, 3, 4].my_inject('+')).to eq([1, 2, 3, 4].inject('+'))
    end
  end
  describe '#my_inject' do
    it 'my_inject will return the multiplication with 2 of array with * symbol' do
      expect([1, 2, 3, 4].my_inject(2, :*)).to eq([1, 2, 3, 4].inject(2, :*))
    end
  end
end

# rubocop:enable Metrics/LineLength
