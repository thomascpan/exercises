# Linked List

class LinkedList
  attr_accessor :head
  attr_accessor :length

  def initialize
    @head = nil
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

  def insert(value,index=nil)
    current_node = @head
    if index.nil?
      if current_node.nil?
        @head = Node.new(value) 
      else
        while current_node.next_node
          current_node = current_node.next_node
        end
        current_node.next_node = Node.new(value)
      end
    else
      if index == 0
        if current_node.nil?
          @head = Node.new(value)
        else
          @head = Node.new(value,@head)
        end
      else
        return false if current_node.nil?

        (index-1).times do 
          current_node = current_node.next_node
        end
        next_node = current_node.next_node
        current_node.next_node = Node.new(value,next_node)
      end
    end

    @length+=1
    return value
  end

  def delete(index=0)
    current_node = @head
    value = false

    if index == 0
      if current_node
        @head = current_node.next_node
      end
    else
      (index-1).times do
        current_node = current_node.next_node
        return false if current_node.next_node.nil?
      end
      next_node = current_node.next_node.next_node
      current_node.next_node = next_node
    end

    @length-=1 if value
    return value
  end

  def reverse1
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

  # Recursive
  def reverse2(current_node=@head)
    if current_node.next_node.nil?
      @head = current_node
      return current_node
    end
    previous_node = reverse2(current_node.next_node)
    current_node.next_node = previous_node.next_node
    previous_node.next_node = current_node
  end

  def print_values1
    current_node = @head

    return if current_node.nil?

    while current_node
      print "#{current_node.value} "
      current_node = current_node.next_node
    end
    puts
  end

  # Recursive
  def print_values2(current_node=@head)
    return puts if current_node.nil?
    print "#{current_node.value} "
    print_values2(current_node.next_node)
  end

  # Recursive
  def reverse_print(current_node=@head)
    return if current_node.nil?
    reverse_print(current_node.next_node)
    print "#{current_node.value} "
  end

  # Assumes all nodes are eqaual after merge point.
  def self.find_merge_point(lla,llb)
    difference = (lla.length - llb.length).abs

    current_node_a = lla.head
    current_node_b = llb.head

    if lla.length > llb.length
      current_node_a, current_node_b = current_node_b, current_node_a
    end

    difference.times do 
      current_node_b = current_node_b.next_node
    end

    while current_node_a && current_node_b
      return current_node_a.value if current_node_a.value == current_node_b.value
      current_node_a = current_node_a.next_node
      current_node_b = current_node_b.next_node
    end

    return false
  end
end

class Node
  attr_accessor :value
  attr_accessor :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end