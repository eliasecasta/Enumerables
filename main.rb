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
    else
      args.empty? ? my_each { |i| return false if i.nil? } : my_each { |i| return false if i != args[0] }
    end
    true
  end

  def my_any?(*args)
    if block_given?
      my_each { |i| return true if yield i }
    elsif args != [] && args[0].class == Class # tiene argumentos y no es un un Regxp
      my_each { |i| return true if i.is_a?(args[0]) }
    elsif args[0].class == Regexp
      my_each { |i| return true unless (args[0] =~ i).nil? }
    else
      my_each { |i| return true if i.nil? }
    end
    false
  end

  def my_none?(*args)
    if block_given?
      my_each { |i| return false if yield i }
    elsif args != [] && args[0].class != Regexp
      my_each { |i| return false if i.is_a?(args[0]) }
    elsif args[0].class == Regexp
      my_each { |i| return false unless (args[0] =~ i).nil? }
    else
      my_each { |i| return false if i == true }
    end
    true
  end

  def my_count(*args)
    @var = self
    empty_arr = []

    if block_given?
      my_each { |i| empty_arr << i if yield i }

      empty_arr.length
    else
      !args.empty? ? @var.length - (self - args).length : length
    end
  end

  def my_map(*args)
    return to_enum(__method__) unless block_given? || args[0].class == Proc

    array = []
    args[0].class == Proc ? my_each { |i| array << args[0].call(i) } : my_each { |i| array << (yield i) }
    array
  end

  def my_inject(*args)
    accu = 1
    sym = args.length > 1 ? args[1] : args[0]
    if (args.length > 1) && (args[0].object_id != :*.object_id)
      accu = args[0]
    elsif (args.length == 1) && (args[0].class != Symbol)
      accu = args[0]
    elsif args[0].object_id != :*.object_id
      accu = 0
    end
    if block_given? && to_a[0].is_a?(String)
      accu = self
      sym = nil
      my_each { |i| accu = yield accu, i }
    elsif block_given?
      my_each { |i| accu = yield accu, i }
    else
      my_each { |i| accu = accu.method(sym).call(i) }
    end
    accu
  end
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
end

def multiply_els(arr)
  arr.inject(:*)
end

# block = proc { |num| num < (0 + 9) / 2 }
# p (0..10).my_each(&block) == (0..10).each(&block)

# block = proc { |num, idx| "Num: #{num}, idx: #{idx}\n" }
# p [0, 1, 5, 10].my_each_with_index(&block) == [0, 1, 5, 10].each_with_index(&block)

# block = proc { |k, v| v < (0 + 9) / 2 }
# var = { a: 1, b: 2, c: 3, d: 4, e: 5 }.my_each_with_index(&block) =={ a: 1, b: 2, c: 3, d: 4, e: 5 }.each_with_index(&block)
# p var

# block = proc { |num| num < (0 + 9) / 2 }
# p (0..10).my_select(&block) == (0..10).select(&block)

# false_block = proc { |num| num > 100 }
# p (0..10).my_all?(&false_block) == (0..10).all?(&false_block)

# p [1, 2, 3, 5].my_all?(3) == [1, 2, 3, 5].all?(3)
# p %w[s s saa q].my_all? == %w[s s saa q].all?