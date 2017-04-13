# Expression Converter
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

def evaluate_postfix(expression)
  stack = Array.new

  expression.each do |e|
    if @expressions.include?(e)
      y = stack.pop
      x = stack.pop

      return false if x.nil? || y.nil?
      stack.push(x.to_i.method(e).(y.to_i))
    else
      stack.push(e)
    end
  end

  result = stack.pop
  return stack.empty? ? result : false
end

def evaluate_prefix(expression)
  stack = Array.new

  expression.reverse.each do |e|
    if @expressions.include?(e)
      x = stack.pop
      y = stack.pop

      return false if x.nil? || y.nil?
      stack.push(x.to_i.method(e).(y.to_i))
    else
      stack.push(e)
    end
  end

  result = stack.pop
  return stack.empty? ? result : false
end

def infix_to_postfix(expression)
  stack = Array.new
  result = Array.new

  expression.each do |e|
    if @expressions.include?(e)
      while !stack.empty? && !@mappings.key(stack.last) && @precedence[stack.last] >= @precedence[e]
        result.push(stack.pop)
      end
      stack.push(e)
    elsif @mappings[e]
      while !stack.empty? && stack.last != @mappings[e]
        result.push(stack.pop)
      end
      stack.pop
    elsif @mappings.key(e)
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