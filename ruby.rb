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
      my_each { |i| return false if yield i }
    elsif _args != [] && _args[0].class != Regexp
      my_each { |i| return false if i.is_a?(_args[0]) }
    elsif _args[0].class == Regexp
      my_each { |i| return false unless (_args[0] =~ i).nil? }
    else
      my_each { |i| return false if i == true }
    end
    true
  end

  def my_count(*_args)
    @var = self
    empty_arr = []

    if block_given?
      my_each { |i| empty_arr << i if yield i }

      empty_arr.length
    else
      !_args.empty? ? @var.length - (self - _args).length : length
    end
  end

  def my_map(*_args)
    return to_enum(__method__) unless block_given?

    array = []

    each { |i| array << (yield i) }
    array
  end

  def my_inject(*_args)
    accu = 0
    sym = 0
    if _args.length > 1
      sym = _args[1]
      accu = _args[0] if _args[0] != 0
    elsif _args.length == 1
      if _args[0].class == Symbol
        sym = _args[0]
      else
        accu = _args[0]
      end
    end
    if block_given? && self.to_a[0].is_a?(String)
      accu=self
      sym=nil
      each { |i| accu = yield accu, i }
    elsif block_given? 
      each { |i| accu = yield accu, i }
    else
      each { |i| accu = accu.method(sym).call(i)}
    end
    accu
  end


  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
end



p (5..10).my_inject { |sum, u| sum + u }

longest = %w{ cat sheep bear }.my_inject do |memo, word|
  memo.length > word.length ? memo : word
end
p longest 

#accu = accu.method(sym).call(i)
#p(5..10).inject(1) { |_acuu, _word| rest } #=> 151200
# find the longest word
# p ary.my_count #=> 4
# p ary.my_count(2) #=> 2
# p ary.my_count(&:even?) #=> 3

# p (1..4).my_map { |i| i * i }
