# Stack: Array Implementation

class Stack
  attr_reader :list
  attr_reader :index

  def initialize(length)
    @list = Array.new(length)
    @index = -1
  end

  def push(value)
    @index+=1
    if @index == @list.length
      new_list = Array.new(@list.length*2)

      @list.each_with_index do |e,i|
        new_list[i] = e
      end

      @list = new_list
    end

    @list[@index] = value

    return value
  end

  def pop
    return false if @index == -1

    value = @list[@index]
    @index-=1

    return value
  end

  def empty?
    return @index == -1
  end

  def length
    return @index+1
  end

  def top
    return nil if @index == -1
    return @list[@index]
  end

  def print_values
    (@index+1).times do |e|
      print "#{@list[e]} "
    end
    puts
  end
end