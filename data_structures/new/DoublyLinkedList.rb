# Doubly Linked List

class DoublyLinkedList
  attr_accessor :head
  attr_accessor :tail
  attr_accessor :length

  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end

  def get(index)
    current_node = @head

    index.times do
      current_node = current_node.next_node
      return false if current_node.nil?
    end

    return current_node.value
  end

  # Insert. Default: Insert at head.
  def insert(value,index=0)
    current_node = @head

    if index == 0
      next_node = current_node
      if next_node
        @head = Node.new(value,nil,next_node)
        next_node.prev_node = @head if next_node
      else
        push(value)
      end
    elsif index > @length
      return false
    elsif index == @length
      return push(value)
    else
      (index-1).times do
        current_node = current_node.next_node
      end
      next_node = current_node.next_node
      current_node.next_node = Node.new(value,current_node,next_node)
      next_node.prev_node = current_node.next_node
    end

    @length+=1
    return value
  end

  # Insert at tail.
  def push(value)
    if @length > 0
      @tail.next_node = Node.new(value,@tail)
      @tail = @tail.next_node
    else
      @head = Node.new(value)
      @tail = @head
    end

    @length+=1
    return value
  end

  # Delete at tail.
  def pop
    current_node = @tail
    prev_node = current_node.prev_node
    prev_node.next_node = nil
    @tail = prev_node

    @length-=1
    return current_node.value
  end

  # Delete. Default: Delete at head.
  def delete(index=0)
    current_node = @head

    if index == 0
      next_node = current_node.next_node
      next_node.prev_node = nil
      @head = next_node
    elsif index >= @length
      return false
    elsif index == (@length-1)
      return pop
    else
      index.times do 
        current_node = current_node.next_node
      end
      prev_node = current_node.prev_node
      next_node = current_node.next_node
      prev_node.next_node = next_node
      next_node.prev_node = prev_node
    end

    @length-=1
    return current_node.value
  end

  def reverse
    current_node = @head

    while current_node
      prev_node = current_node.prev_node
      next_node = current_node.next_node
      current_node.prev_node, current_node.next_node = current_node.next_node, current_node.prev_node
      current_node = next_node
    end

    @head,@tail = @tail,@head
  end

  def print_values
    current_node = @head

    while current_node
      print "#{current_node.value} "
      current_node = current_node.next_node
    end
    puts
  end

  def reverse_print_values()
    current_node = @tail

    while current_node
      print "#{current_node.value} "
      current_node = current_node.prev_node
    end
    puts
  end
end

class Node
  attr_accessor :value
  attr_accessor :prev_node
  attr_accessor :next_node

  def initialize(value,prev_node=nil,next_node=nil)
    @value = value
    @prev_node = prev_node
    @next_node = next_node
  end
end