# Enumerable

module Enumerable
  def my_each
    return to_enum(__method__) unless block_given?

    if is_a?(Array)

      length.times do |i|
        yield self[i]
      end

    else length.times do |i|
      yield [keys[i], values[i]]
    end
    end
  end

  def my_each_index
    return to_enum(__method__) unless block_given?

    length.times do |i|
      yield self[i], i
    end
  end
end

# def my_each
#   return to_enum(__method__) unless block_given?

#   size.times { |i| yield(to_a[i]) }
#   self
# end

friends = %w[Jessica Michelle Elias Castañeda]

friends.each { |friend| puts 'Hello, ' + friend }

my_hash = { 'one' => 5, 'two' => 2 }

my_hash.my_each { |key, value| puts "#{key} is #{value}" }

p my_hash.my_each

my_hash.each { |key, value| puts "#{key} is #{value}" }

# p my_hash.each

hash2 = {}

xy = %w[cat dog wombat].my_each_index { |item, index| hash2[item] = index }

p hash2

hash3 = {}

xyz = %w[cat dog wombat].each_with_index { |item, index| hash3[item] = index }

p hash3
