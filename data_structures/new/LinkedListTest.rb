require_relative 'LinkedList'

p "linked_list1"
# INITIALIZE
linked_list1 = LinkedList.new

# INSERT
linked_list1.insert(1)
linked_list1.insert(2)
linked_list1.insert(0,0)

# PRINT_VALUES1
linked_list1.print_values1

# GET
p linked_list1.get(0)
p linked_list1.get(1)
p linked_list1.get(2)
p linked_list1.get(3)

# DELETE
# linked_list1.delete(1)

# PRINT_VALUES2
linked_list1.print_values2

# REVERSE_PRINT
puts linked_list1.reverse_print

puts

p "linked_list2"
# INITIALIZE
linked_list2 = LinkedList.new

# INSERT
linked_list2.insert(-2)
linked_list2.insert(-1)
linked_list2.insert(0)
linked_list2.insert(1)
linked_list2.insert(2)

# PRINT_VALUES1
linked_list2.print_values1

# REVERSE1
linked_list2.reverse1

# PRINT_VALUES2
linked_list2.print_values2

# REVERSE1
linked_list2.reverse2

# PRINT_VALUES2
linked_list2.print_values2

# FIND_MERGE_POINT
p LinkedList.find_merge_point(linked_list1,linked_list2)