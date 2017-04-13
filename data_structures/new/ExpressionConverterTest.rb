require_relative "ExpressionConverter"

p evaluate_postfix(["2", "3", "*", "5", "4", "*", "+", "9", "-"]) == 17

p evaluate_prefix(["-", "+", "*", "2", "3", "*", "5", "4", "9"]) == 17

p infix_to_postfix(["A", "+", "B", "*", "C", "-", "D", "*", "E"]) == ["A", "B", "C", "*", "+", "D", "E", "*", "-"]

p infix_to_postfix(["(","(","A","+","B",")","*","C","-","D",")","*","E"]) == ["A","B","+","C","*","D","-","E","*"]

p infix_to_postfix(["A","*","(","B","+","C",")"]) == ["A","B","C","+","*"]