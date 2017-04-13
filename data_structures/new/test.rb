class LinkedList
  include Enumerable

  attr_accessor :head

  def initialize
    @head = nil
  end

  def insert(value)
    current_node = @head

    if current_node.nil?
      @head = Node.new(value)
    else
      while current_node.next_node
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(value)
    end
  end

  def each(&block)
    return enum_for(:each) unless block_given?
    current_node = @head

    return if current_node.nil?
      
    while current_node
      yield current_node.value
      current_node = current_node.next_node
    end
  end

  def map(&block)
    return enum_for(:map) unless block_given?
    current_node = @head

    return if current_node.nil?
      
    while current_node
      yield current_node.value
      current_node = current_node.next_node
    end
  end
end

class Node
  attr_accessor :next_node
  attr_accessor :value

  def initialize(value,next_node=nil)
    @value = value
    @next_node = next_node
  end
end


ll = LinkedList.new
[0,1,2,3,4,5].each do |e|
  ll.insert(e)
end

ll.each do |e|
  p e
end
