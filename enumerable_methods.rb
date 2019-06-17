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


end