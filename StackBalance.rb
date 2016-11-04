require_relative "Stack.rb"

class StackBalance
  def balanced?(input)
    stack = Stack.new(input.length)

    mappings = {
      "}" => "{",
      "]" => "[",
      ")" => "("    
    }

    input.each_char do |e|
      if mappings.values.include?(e)
        stack.push(e)
      elsif mappings.keys.include?(e)
        if mappings[e] != stack.pop
          return false
        end
      end
    end
    return stack.empty?
  end
end


sb = StackBalance.new

p sb.balanced?("[(a+b)*(c+d)]") == true

p sb.balanced?("[[a+b{{)]]") == false