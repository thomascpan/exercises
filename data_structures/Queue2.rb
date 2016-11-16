# Queue: Linked List
class Queue

  def initialize(size)
    @head = nil
    @tail = nil
  end

  def push(value)
    if empty?
      @head = Node.new(value)
      @tail = @head
    else
      @tail.next_node = Node.new(value)
      @tail = @tail.next_node
    end
    return value
  end

  def pop
    if empty?
      return nil
    else
      popped_value = @head.value
      @head = @head.next_node
      return popped_value
    end
  end

  def empty?
    return @head.nil?
  end

  def front
    return @head.value
  end

  def print_queue
    current_node = @head
    while !current_node.nil?
      print current_node.value.to_s + ' '
      current_node = current_node.next_node
    end
    puts
  end
end

class Node
  attr_accessor :value
  attr_accessor :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

q = Queue.new(5)

6.times do |i|
  p q.push(i)
end

7.times do 
  p q.pop
  q.print_queue
end

q.print_queue