# Stack: Linked List Implementation
require_relative "LinkedList"

class Stack
  def initialize
    @linked_list = LinkedList.new
  end

  def push(value)
    @linked_list.insert(value,0)
  end

  def pop
    @linked_list.delete
  end

  def empty?
    return @linked_list.length == 0
  end

  def length
    return @linked_list.length
  end

  def top
    return @linked_list.head
  end

  def print_values
    @linked_list.print_values1
  end
end