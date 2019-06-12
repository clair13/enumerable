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
end