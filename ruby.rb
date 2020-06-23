# Enumerable
module Enumerable
  def my_each
    return to_enum(__method__) unless block_given?

    if is_a?(Array)
      size.times do |i|
        yield self[i]
      end
    else size.times do |i|
      yield [keys[i], values[i]]
    end
    end
  end

  def my_each_with_index
    return to_enum(__method__) unless block_given?

    size.times do |i|
      yield self[i], i
    end
  end

  def my_select
    return to_enum(__method__) unless block_given?

    array = []
    my_each do |i|
      array << i if yield i
    end
    array
  end

  def my_all?(*_args)
    if block_given?
      my_each { |i| return false unless yield i }
    elsif _args != [] && _args[0].class != Regexp
      my_each { |i| return false unless i.is_a?(_args[0]) }
    elsif _args[0].class == Regexp
      my_each { |i| return false if (_args[0] =~ i).nil? }
    else
      my_each { |i| return false unless i.nil? }
    end
    true
  end

  def my_any?(*_args)
    if block_given?
      my_each { |i| return true if yield i }
    elsif _args != [] && _args[0].class != Regexp
      my_each { |i| return true if i.is_a?(_args[0]) }
    elsif _args[0].class == Regexp
      my_each { |i| return true unless (_args[0] =~ i).nil? }
    else
      my_each { |i| return true if i.nil? }
    end
    false
  end
end

p %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
p %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
p %w[ant bear cat].my_any?(/d/) #=> false
p [nil, true, 99].my_any?(Integer) #=> true
p [nil, true, 99].my_any? #=> true
p [].my_any? #=> false

# p %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
# p %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
# p [1, 2i, 3.14].my_all?(Numeric) #=> true
# p [nil, true, 99].my_all? #=> false
# p [].my_all? #=> true
# p %w[asnt beart cat].my_all?(/t/) #=> false
# friends = %w[Brian Brian Brian Leo Leila Brian Brian Arun Brian Sharon]
# friends.my_select { |friend| friend == 'Brian' }
# friends.my_select { |friend| friend != 'Brian' }

# def my_each
#   return to_enum(__method__) unless block_given?
#   size.times { |i| yield(to_a[i]) }
#   self
# end
# friends.each { |friend| puts 'Hello, ' + friend }
# my_hash = { 'one' => 5, 'two' => 2 }
# my_hash.my_each { |key, value| puts "#{key} is #{value}" }
# p my_hash.my_each
# my_hash.each { |key, value| puts "#{key} is #{value}" }
# # p my_hash.each
# hash2 = {}
# xy = %w[cat dog wombat].my_each_with_index { |item, index| hash2[item] = index }
# p hash2
# hash3 = {}
# xyz = %w[cat dog wombat].each_with_index { |item, index| hash3[item] = index }
# p hash3
