class DoublyLinkedList
  attr_reader :head
  attr_reader :tail
  attr_reader :length

  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end

  def push(value)
    if length == 0
      @head = Node.new(value, nil, nil)
      @tail = @head
    else
      @tail.next_node = Node.new(value, @tail, nil)
      @tail = @tail.next_node
    end
    @length+=1
    return value
  end

  def pop
    return nil if @length == 0

    current_node = @tail
    if @length == 1
      @head = nil
      @tail = nil
    else
      @tail = current_node.prev_node
      @tail.next_node = nil
    end
    @length-=1
    return current_node.value
  end

  def get(index)
    return nil if (index+1) > length

    return @head.value if index == 0

    if @length/index == 1
      current_node = @tail
      (@length-index-1).times do
        current_node = current_node.prev_node
      end
    else
      current_node = @head
      index.times do 
        current_node = current_node.next_node
      end
    end

    return current_node.value
  end

  def insert(value, index)
    return nil if (index) > length

    if index == 0
      current_node = @head
      @head = Node.new(value, nil, current_node)
      current_node.prev_node = @head
      @length+=1
      return value
    elsif index == (@length-1)
      current_node = @tail
      prev_node = @tail.prev_node
      prev_node.next_node = Node.new(value, prev_node, current_node)
      current_node.prev_node = prev_node.next_node
      @length+=1
      return value 
    elsif index == @length
      @tail.next_node = Node.new(value, @tail, nil)
      @tail = @tail.next_node
      @length+=1
      return value
    end

    if @length/index == 1
      current_node = @tail
      (@length-index-1).times do
        current_node = current_node.prev_node
      end
    else
      current_node = @head
      index.times do 
        current_node = current_node.next_node
      end
    end

    next_node = current_node.next_node
    current_node.next_node = Node.new(value, current_node, next_node)
    next_node.prev_node = current_node.next_node
    @length+=1
    return value
  end

  def delete(index)
    return nil if (index+1) > length

    if index == 0
      current_node = @head
      @head = current_node.next_node
      @head.prev_node = nil
      @length-=1
      return current_node.value 
    elsif index == (@length-1)
      current_node = @tail
      @tail = current_node.prev_node
      @tail.next_node = nil
      @length-=1
      return current_node.value 
    end

    if @length/index == 1
      current_node = @tail
      (@length-index-1).times do
        current_node = current_node.prev_node
      end
    else
      current_node = @head
      index.times do 
        current_node = current_node.next_node
      end
    end

    prev_node = current_node.prev_node
    next_node = current_node.next_node
    prev_node.next_node = next_node
    next_node.prev_node = prev_node
    @length-=1
    return current_node.value
  end

  def print_values
    return nil if @head.nil?

    current_node = @head
    while current_node.next_node
      print current_node.value.to_s + ", "
      current_node = current_node.next_node
    end
    puts current_node.value.to_s
  end
end

class Node
  attr_accessor :value
  attr_accessor :next_node
  attr_accessor :prev_node

  def initialize(value,prev_node = nil, next_node = nil) 
    @value = value
    @next_node = next_node
    @prev_node = prev_node
  end
end

ll = DoublyLinkedList.new

p ll.push(0)
p ll.push(1)
p ll.push(2)
p ll.push(3)
p ll.push(4)

ll.print_values

p ll.insert("a", 3)
ll.print_values
p ll.insert("a", 0)
ll.print_values
p ll.insert("a", 7)
ll.print_values