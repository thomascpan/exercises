require_relative "BinarySearchTree"

tree1 = BinarySearchTree.new

tree1.insert1(7)
tree1.insert1(3)
tree1.insert1(1)

tree1.delete(7)

puts tree1.print_values1

p tree1.search1(7)
p tree1.search1(3)
p tree1.search1(1)
p tree1.search1(0)

p tree1.min1
p tree1.max1

p tree1.height

p tree1.bst?

p tree1.min_node


tree2 = BinarySearchTree.new

tree2.insert2(1)
tree2.insert2(3)
tree2.insert2(7)

tree2.delete(7)

puts tree2.print_values2

p tree2.search2(7)
p tree2.search2(3)
p tree2.search2(1)
p tree2.search2(0)

p tree2.min2
p tree2.max2

p tree2.height

p tree2.bst?

p tree2.min_node

tree3 = BinarySearchTree.new

tree3.insert1(20)
tree3.insert1(2)
tree3.insert1(1)
tree3.insert1(10)
tree3.insert1(7)
tree3.insert1(13)
tree3.insert1(30)
tree3.insert1(25)
tree3.insert1(35)

puts tree3.print_values2

tree3.delete(20)

puts tree3.print_values2

[20,2,1,10,7,13,30,25,35].each do |e|
  p tree3.next_value(e)
end