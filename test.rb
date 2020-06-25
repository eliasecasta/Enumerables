require_relative ruby.rb

ary = [1, 2, 4, 2, 2, 2, 2, 2, 2]
p [4,5,6,4].count #=> 4
p ary.my_count(2) #=> 2
p %w[ant bear cat].my_none? { |word| word.length == 5 } #=> true
p %w[ant bear cat].my_none? { |word| word.length >= 4 } #=> false
p %w[ant bear cat].my_none?(/d/) #=> true
p [1, 3.14, 42].my_none?(Float) #=> false
p [].my_none? #=> true
p [nil].my_none? #=> true
p [nil, false].my_none? #=> true


p %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
p %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
p %w[ant bear cat].my_any?(/d/) #=> false
p [nil, true, 99].my_any?(Integer) #=> true
p [nil, true, 99].my_any? #=> true
p [].my_any? #=> false

p %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
p %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
p [1, 2i, 3.14].my_all?(Numeric) #=> true
p [nil, true, 99].my_all? #=> false
p [].my_all? #=> true
p %w[asnt beart cat].my_all?(/t/) #=> false
friends = %w[Brian Brian Brian Leo Leila Brian Brian Arun Brian Sharon]
friends.my_select { |friend| friend == 'Brian' }
friends.my_select { |friend| friend != 'Brian' }

friends.each { |friend| puts 'Hello, ' + friend }
my_hash = { 'one' => 5, 'two' => 2 }
my_hash.my_each { |key, value| puts "#{key} is #{value}" }
p my_hash.my_each
my_hash.each { |key, value| puts "#{key} is #{value}" }
# p my_hash.each
hash2 = {}
xy = %w[cat dog wombat].my_each_with_index { |item, index| hash2[item] = index }
p hash2
hash3 = {}
xyz = %w[cat dog wombat].each_with_index { |item, index| hash3[item] = index }
p hash3

p ary.my_count #=> 4
p ary.my_count(2) #=> 2
p ary.my_count(&:even?) #=> 3

p (1..4).my_map { |i| i * i }