# Array Implementation
class Stack
  def initialize(size)
    @index = -1
    @array = Array.new(size)
  end

  def push(value)
    if (@index+1) >= length
      new_array = Array.new(length*2)
      i = 0
      while i<length
        new_array[i] = @array[i]
        i+=1
      end
      @array = new_array
    end
    @index+=1
    @array[@index] = value
    return value
  end

  def pop
    value = @array[@index]
    @array[@index] = nil
    @index-=1
    return value
  end

  def empty?
    return @index == -1
  end

  def length
    return @array.length
  end

  def top
    return @array[@index]
  end

  def print_stack
    i = 0
    while !@array[i].nil?
      print @array[i].to_s + " "
      i+=1
    end
    puts
  end
end

# s = Stack.new(5)

# p s.empty?
# p s.push(0)
# p s.push(1)
# p s.push(2)
# p s.push(3)
# p s.push(4)
# p s.push(5)

# s.print_stack 

# p s.empty?
# p s.pop
# p s.pop

# p s.length

# s.print_stack 