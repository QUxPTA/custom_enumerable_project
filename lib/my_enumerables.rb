module Enumerable
  # Your code goes here
  def my_select
    return to_enum(:my_select) unless block_given?

    result = []
    my_each do |element|
      result << element if yield(element)
    end

    result
  end

  def my_all?
    if block_given?
      my_each do |element|
        return false unless yield(element)
      end
    else
      my_each do |element|
        return false unless element
      end
    end
    true
  end

  def my_none?
    if block_given?
      my_each do |element|
        return false if yield(element)
      end
    else
      my_each do |element|
        return false if element
      end
    end
    true
  end

  def my_count(arg = nil)
    count = 0

    if arg
      my_each { |element| count += 1 if element == arg }
    elsif block_given?
      my_each { |element| count += 1 if yield(element) }
    else
      my_each { count += 1 }
    end

    count
  end

  def my_map
    return to_enum(:my_map) unless block_given?

    result = []
    my_each do |element|
      result << yield(element)
    end

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
    return to_enum(:my_each) unless block_given?

    for item in self do
      yield(item)
    end

    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    index = 0
    for item in self do
      yield(item, index)
      index += 1
    end

    self
  end
end
