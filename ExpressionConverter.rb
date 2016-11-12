class ExpressionConverter
  def initialize
    @expressions = ["*", "/", "+", "-"]
    @precedence = {
      "+" => 0,
      "-" => 0,
      "*" => 1,
      "/" => 1,
    }
    @mappings = {
      "}" => "{",
      "]" => "[",
      ")" => "("    
    }
  end

  def evaluate_postfix(expression)
    stack = Array.new
    expression.each do |e|
      if @expressions.include?(e)
        y = stack.pop.to_i
        x = stack.pop.to_i
        if x.nil? || y.nil?
          puts "Error"
          return
        else
          stack.push(x.method(e).(y))
        end
      else
        stack.push(e)
      end
    end

    answer = stack.pop
    if !stack.empty?
      puts "Error"
      return
    else
      return answer
    end
  end

  def evaluate_prefix(expression)
    stack = Array.new
    i = (expression.length - 1)
    while i >= 0
      if @expressions.include?(expression[i])
        x = stack.pop.to_i
        y = stack.pop.to_i
        stack.push(x.method(expression[i]).(y))
      else
        stack.push(expression[i])
      end
      i-=1
    end

    answer = stack.pop
    if !stack.empty?
      puts "Error"
      return
    else
      return answer
    end
  end

  def infix_to_postfix(expression)
    stack = Array.new
    result = Array.new
    expression.each do |e|
      if @mappings.values.include?(e)
        stack.push(e)
      elsif @mappings.keys.include?(e)
        while !stack.empty? && !@mappings.values.include?(stack.last)
          result.push(stack.pop)
        end
        stack.pop
      elsif @expressions.include?(e)
        while !stack.empty? && (!@mappings.values.include?(stack.last) && @precedence[stack.last] >= @precedence[e])
          result.push(stack.pop)
        end
        stack.push(e)
      else
        result.push(e)
      end
    end
    while !stack.empty?
      result.push(stack.pop)
    end
    return result
  end
end



# p ExpressionConverter.infix_to_postfix("A*B+C*d-e") == "AB*Cd*+e-"

ec = ExpressionConverter.new

p ec.evaluate_postfix(["2", "3", "*", "5", "4", "*", "+", "9", "-"]) == 17

p ec.evaluate_prefix(["-", "+", "*", "2", "3", "*", "5", "4", "9"]) == 17

p ec.infix_to_postfix(["A", "+", "B", "*", "C", "-", "D", "*", "E"]) == ["A", "B", "C", "*", "+", "D", "E", "*", "-"]

p ec.infix_to_postfix(["(","(","A","+","B",")","*","C","-","D",")","*","E"]) == ["A","B","+","C","*","D","-","E","*"]

p ec.infix_to_postfix(["A","*","(","B","+","C",")"]) == ["A","B","C","+","*"]