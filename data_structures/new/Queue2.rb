# Queue: Linked List Implementation
require_relative "DoublyLinkedList"

class Queue
  def initialize
    @list = DoublyLinkedList.new
  end

  def push(value)
    return @list.insert(value)
  end

  def pop
    return @list.pop
  end

  def empty?
    return @list.length == 0
  end

  def front
    return @list.tail ? @list.tail.value : @list.tail
  end

  def print_values
    @list.print_values
  end
end