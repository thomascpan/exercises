require_relative "Queue1"

queue = Queue.new(2)

# EMPTY
p queue.empty?
p queue.front

queue.push(0)
queue.push(1)
queue.push(2)

p queue.empty?
p queue.front
queue.print_values

queue.pop

p queue.front
queue.print_values