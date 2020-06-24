# Enumerable
module Enumerable
  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

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

  def my_none?(*_args)
    if block_given?
      each { |i| return false if yield i }
    elsif _args != [] && _args[0].class != Regexp
      each { |i| return false if i.is_a?(_args[0]) }
    elsif _args[0].class == Regexp
      each { |i| return false unless (_args[0] =~ i).nil? }
    else
      each { |i| return false if i == true }
    end
    true
  end

  def my_count(*_args)
    @var = self
    !_args.empty? ? @var.length - (self - _args).length : length
  end

  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
end

ary = [1, 2, 4, 2, 2, 2, 2, 2, 2] 
p ary.count #=> 4
p ary.my_count(2) #=> 2
