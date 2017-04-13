# Stack Application: Stack Balance

require_relative "Stack1"

def balanced?(expression)
  stack = Stack.new(100)

  mappings = {
    "{" => "}",
    "(" => ")",
    "[" => "]"
  }

  expression.each_char do |e|
    if mappings[e]
      stack.push(e)
    else
      key = mappings.key(e)
      return false if (key && key != stack.pop)
    end 
  end
  
  return true if stack.empty?
end