require_relative "DoublyLinkedList"

doubly_linked_list1 = DoublyLinkedList.new

# PUSH
doubly_linked_list1.push(1)
doubly_linked_list1.push(3)
doubly_linked_list1.push(4)

# INSERT
doubly_linked_list1.insert(0)
doubly_linked_list1.insert(2,2)
doubly_linked_list1.insert(5,5)

# GET
p doubly_linked_list1.get(5)

# POP
doubly_linked_list1.pop

# DELETE
doubly_linked_list1.delete

# PRINT_VALUES
doubly_linked_list1.print_values

# REVERSE_PRINT_VALUES
doubly_linked_list1.reverse_print_values

# REVERSE
doubly_linked_list1.reverse
doubly_linked_list1.print_values