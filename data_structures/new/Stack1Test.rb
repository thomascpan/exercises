require_relative "Stack1"

# INITIALIZE
stack = Stack.new(2)

# EMPTY?
p stack.empty?

# LENGTH
p stack.length

# PUSH
stack.push(0)

# TOP
stack.top
stack.push(1)
stack.top

stack.push(2)

# LENGTH
p stack.length

# PRINT_VALUES
stack.print_values

# POP
stack.pop

stack.print_values