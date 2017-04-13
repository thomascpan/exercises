require_relative "Queue2"

queue = Queue.new

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