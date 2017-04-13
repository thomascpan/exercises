# Queue: Array Implementation

class Queue
  def initialize(length)
    @list = Array.new(length)
    @head = -1
    @tail = -1
  end

  def push(value)
    @tail+=1
    @head+=1 if @head == -1
    if @tail == @list.length
      new_list = Array.new(@list.length*2)

      @list.each_with_index do |e,i|
        new_list[i] = e
      end

      @list = new_list
    end

    @list[@tail] = value

    return value
  end

  def pop
    @head+=1
    @tail = -1 if @head == -1
  end

  def empty?
    return @head == -1
  end

  def front
    return nil if @head == -1
    return @list[@head]
  end

  def print_values
    return if @head == -1
    @list[@head..@tail].each do |e|
      print "#{e} "
    end
    puts
  end
end