# Access element: O(n)
# Insert element: O(n)
# Delete element: O(n)

# No unused memory
# Extra storage needed for next node
# Dynamic size
# memory may be available as multiple small blocks

class LinkedList
  attr_reader :head
  attr_reader :tail
  attr_reader :length

  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end

  def push(value)
    if @head.nil?
      @head = Node.new(value)
      @tail = @head
    else
      @tail.next_node = Node.new(value)
      @tail = @tail.next_node
    end
    @length+=1
    return value
  end

  def pop
    return nil if @length == 0

    if length == 1
      value = @head.value
      @head = nil
      @tail = nil
    else
      current_node = @head
      (@length-2).times do 
        current_node = current_node.next_node
      end
      value = current_node.next_node.value
      @tail = current_node
      current_node.next_node = nil
    end

    @length-=1
    return value
  end

  def get(index)
    return nil if @head.nil? || index > @length

    current_node = @head
    index.times do 
      current_node = current_node.next_node
    end
    return current_node.value
  end

  def insert(value, index)
    return nil if index > @length

    current_node = @head
    if index == 0
      node = Node.new(value, @head)
      @head = node
      current_node = @head
    else
      (index-1).times do 
        current_node = current_node.next_node
      end
      node = Node.new(value, current_node.next_node)
      current_node.next_node = node
    end
    @tail = current_node if current_node.next_node.nil?
    @length+=1
    return value
  end

  def delete(index)
    return nil if index >= @length

    current_node = @head
    value = nil
    if index == 0
      value = @head.value
      @head = @head.next_node
    else
      (index-1).times do 
        current_node = current_node.next_node
      end
      value = current_node.next_node.value
      current_node.next_node = current_node.next_node.next_node
    end
    @tail = current_node if current_node.next_node.nil?
    @length-=1
    return value
  end

  def reverse
    @tail = @head
    current_node = @head
    previous_node = nil

    while current_node
      next_node = current_node.next_node
      current_node.next_node = previous_node
      previous_node = current_node
      current_node = next_node
    end

    @head = previous_node
  end

  def reverse_recursion(current_node)
    if current_node.next_node
      reverse_recursion(current_node.next_node)
      next_node = current_node.next_node
      next_node.next_node = current_node
      current_node.next_node = nil
      @tail = current_node
    else
      @head = current_node
    end
  end

  def print_values
    return if @head.nil?

    current_node = @head
    while !current_node.next_node.nil? do
      print current_node.value
      print ", "
      current_node = current_node.next_node
    end
    puts current_node.value
  end

  def print_values_recursion(current_node)
    if current_node
      print current_node.value
      print " "
      print_values_recursion(current_node.next_node)
    end
  end

  def print_values_recursion_reverse(current_node)
    if current_node
      print_values_recursion_reverse(current_node.next_node)
      print current_node.value
      print " "
    end
  end
end

class Node
  attr_accessor :value
  attr_accessor :next_node

  def initialize(value,next_node = nil) 
    @value = value
    @next_node = next_node
  end
end


# ll = LinkedList.new

# p ll.push(1)
# p ll.push(2)
# p ll.push(3)
# p ll.push(4)
# ll.print_values

# ll.reverse_recursion(ll.head)

# ll.print_values