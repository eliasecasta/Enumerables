# frozen_string_literal: true

# Enumerable
module Enumerable
  def my_each
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
    length.times do |i|
      yield self[i], i
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

hash2 = {}

xy = %w[cat dog wombat].my_each_index { |item, index| hash2[item] = index }

p hash2

hash3 = {}

xyz = %w[cat dog wombat].each_with_index { |item, index| hash3[item] = index }

p hash3
