require_relative "StackBalance"

p balanced?("[(a+b)*(c+d)]") == true

p balanced?("[[a+b{{)]]") == false