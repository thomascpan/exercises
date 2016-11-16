# Queue: Array Implemenation
# Can also implement circular array if want finite size queue
class Queue
  attr_accessor :list # For testing

  def initialize(size)
    @list = Array.new(size)
    @head = -1
    @tail = -1
  end

  def push(value)
    if @list.length == (@tail+1)
      new_list = Array.new(@list.length*2)
      i = 0
      while @head <= @tail
        new_list[i] = @list[@head]
        @head+=1
        i+=1
      end
      @head = 0
      @tail = i-1
      @list = new_list
    end
    @tail+=1
    @list[@tail] = value
    @head+=1 if @head == -1
    return value
  end

  def pop
    return nil if empty?
    @head+=1
    if @head > @tail
      @head = -1
      @tail = -1
    end
    return @list[@head-1]
  end

  def empty?
    return @head == -1 && @tail == -1
  end

  def front
    return @list.first
  end

  def print_queue
    i = @head
    while i < @tail
      print @list[i].to_s + ","
      i+=1
    end
    puts @list[i].to_s
  end
end

# q = Queue.new(5)

# 6.times do |i|
#   q.push(i)
#   p q.list
# end

# 7.times do 
#   q.pop
#   q.print_queue
# end

# q.print_queue