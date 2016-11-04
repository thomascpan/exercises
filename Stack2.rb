require_relative "LinkedList.rb"

# LinkedList Implementation
class Stack
  def initialize
    @linked_list = LinkedList.new();
  end

  def push(value)
    @linked_list.insert(value,0)
  end

  def pop
    @linked_list.delete(0)
  end

  def empty?
    return @linked_list.head.nil?
  end

  def print_stack
    @linked_list.print_values
  end

  def top
    return @linked_list.head.value
  end
end

# s = Stack.new

# p s.empty?

# p s.push(1)
# p s.push(2)
# p s.push(3)
# p s.push(4)

# p s.empty?

# s.print_stack

# p s.pop

# s.print_stack

# p s.pop
# p s.pop
# p s.pop
# p s.pop

# s.print_stack

def reverse(input)
  s = Stack.new
  input.length.times do |e|
    s.push(input[e])
  end

  output = ''
  while(!s.empty?)
    output << s.pop
  end

  return output
end

p reverse("Thomas")