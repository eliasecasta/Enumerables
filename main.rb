# Enumerable
module Enumerable
  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

  def my_each
    return to_enum(__method__) unless block_given?

    size.times { |i| yield(to_a[i]) }
    self
  end

  def my_each_with_index
    return to_enum(__method__) unless block_given?

    size.times do |i|
      yield to_a[i], i
    end
    self
  end

  def my_select
    return to_enum(__method__) unless block_given?

    array = []
    my_each do |i|
      array << i if yield i
    end
    array
  end

  def my_all?(*args)
    if block_given?
      my_each { |i| return false unless yield i }
    elsif !args.empty? && args[0].class == Class
      my_each { |i| return false unless i == args[0] || i.is_a?(args[0]) }
    elsif !args.empty? && args[0].class == Regexp
      my_each { |i| return false if (args[0] =~ i).nil? }
    elsif args.empty?
      my_each { |i| return false if i.nil? }
    else my_each { |i| return false if i != args[0] }
    end
    true
  end

  def my_any?(*args)
    if block_given?
      my_each { |i| return true if yield i }
    elsif !args.empty? && args[0].class == Class
      my_each { |i| return true if i == args[0] || i.is_a?(args[0]) }
    elsif !args.empty? && args[0].class == Regexp
      my_each { |i| return true unless (args[0] =~ i).nil? }
    elsif args.empty?
      my_each { |i| return true unless i.nil? || i == false }
    else my_each { |i| return true unless i != args[0] }
    end
    false
  end

  def my_none?(*args)
    if block_given?
      my_each { |i| return false if yield i }
    elsif !args.empty? && args[0].class == Class
      my_each { |i| return false if i == args[0] || i.is_a?(args[0]) }
    elsif !args.empty? && args[0].class == Regexp
      my_each { |i| return false unless (args[0] =~ i).nil? }
    elsif args.empty?
      my_each { |i| return false unless i.nil? || i == false }
    else my_each { |i| return false unless i != args[0] }
    end
    true
  end

  def my_count(*args)
    @var = to_a
    empty_arr = []

    if block_given?
      my_each { |i| empty_arr << i if yield i }
      empty_arr.length
    else
      !args.empty? ? @var.length - (to_a - args.to_a).length : to_a.length
    end
  end

  def my_map(*args)
    return to_enum(__method__) unless block_given? || args[0].class == Proc

    array = []
    args[0].class == Proc ? my_each { |i| array << args[0].call(i) } : my_each { |i| array << (yield i) }
    array
  end

  def my_inject(*args)
    accu = 0
    sym = args.length > 1 ? args[1] : args[0]
    if (args.length > 1) && (args[0].object_id != :*.object_id) || (args.length == 1) && (args[0].class != Symbol)
      accu = args[0]
    elsif args[0].object_id == :*.object_id && !block_given?
      accu = 1
    end
    if block_given? && to_a[0].is_a?(String)
      accu = self
      sym = nil
      each { |i| accu = yield accu, i }
    elsif block_given? && args.empty?
      accu = to_a[0]
      size.times { |i| accu = yield accu, to_a[i + 1] if i < size - 1 }
    elsif block_given?
      each { |i| accu = yield accu, i }
    else
      each { |i| accu = accu.method(sym).call(i) }
    end
    accu
  end

  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
end

def multiply_els(arr)
  arr.inject(:*)
end
