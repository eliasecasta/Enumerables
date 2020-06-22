# frozen_string_literal: true

# Some comment
# Enumerable
module Enumerable
  def my_each
    if is_a?(Array)
      length.times do |i|
        yield self[i]
      end
    else
      length.times do |i|
        yield [keys[i], values[i]]
      end
    end
  end
end
friends = %w[Jessica Michelle Elias Castañeda]
friends.each { |friend| puts 'Hello, ' + friend }
my_hash = { 'one' => 5, 'two' => 2 }
my_hash.my_each { |key, value| puts "#{key} is #{value}" }
my_hash.my_each { |pair| puts "the pair is #{pair}" }
my_hash.each { |key, value| puts "#{key} is #{value}" }
my_hash.each { |pair| puts "the pair is #{pair}" }
