module Enumerable
  def my_each
    for i in self
      yield[i]
    end
    self
  end

  def my_each_with_index
    for i in self
      yield self[i], i
    end
    seld
  end

  def my_select
    array = []
    self.my_each { |i| array << i if yield(i) }
    array
  end

  def my_all?
    self.my_each { |i| return false if !yield(i) }
    true
  end

  def my_any?
    self.my_each { |i| return true if yield(i) }
    false
  end

  def my_none?
    self.my_any? { |i| return false if yield(i) }
    true
  end

  def my_count
    if block_given?
      arr = self.my_select { |i| return i if yield(x) }
      arr.size
    else
      self.size
    end
  end

  def my_map(proc = nil )
    map_arr = []
    if proc
      self.my_each { |i| map_arr << proc.call(i) }
    elsif block_given?
      self.my_each { |i| map_arr << yield(i) }
    end
    map_arr
  end

  def my_inject(initial = nil)
    initial ? result = initial : result = self[0]
    for i in self[1...self.length] do
      result = yield(result, i)
    end
    result
  end 
  
  def multiply_els(array)
    array.my_inject { |result, i| result * i}
  end
end