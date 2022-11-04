module Enumerable
  # Your code goes here
  def my_each_with_index
    return self.to_enum unless block_given?

    index = 0
    for value in self
      yield value, index
      index += 1
    end
  end

  def my_select 
    answer = []
    self.my_each{|value| answer << value if yield(value)}
    answer
  end

  def my_all?
    all = true
    self.my_each{|value| all = false unless yield(value)}
    all
  end

  def my_any?
    any = false
    self.my_each{|value| any = true if yield(value)}
    any
  end

  def my_none?
    none = true
    self.my_each{|value| none = false if yield(value)}
    none
  end

  def my_count
    return self.size unless block_given?
    count = 0
    self.my_each{|value| count += 1 if yield(value)}
    count
  end

  def my_map
    result = []
    self.my_each{|value| result << yield(value)}
    result
  end

  def my_inject(starting)
    result = starting
    self.my_each{|value| result = yield(result, value)}
    result 
  end

  
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return self.to_enum unless block_given?
    for i in self
      yield i
    end
  end
end
