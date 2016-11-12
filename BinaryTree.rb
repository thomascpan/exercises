class BinaryTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def search(value)
    return false if @root.nil?
    current_node = @root
    while current_node
      return true if current_node.value == value
      if value <= current_node.value
        return false if current_node.left_node.nil?
        current_node = current_node.left_node
      else
        return false if current_node.right_node.nil?
        current_node = current_node.right_node
      end
    end
  end

  def insert(value)
    if @root.nil?
      @root = Node.new(value)
    else
      current_node = @root
      while current_node
        if value <= current_node.value
          if current_node.left_node.nil?
            current_node.left_node = Node.new(value)
            break
          end
          current_node = current_node.left_node
        else
          if current_node.right_node.nil?
            current_node.right_node = Node.new(value)
            break
          else
            current_node = current_node.right_node
          end
        end
      end
    end
    return value
  end

  def max
    return nil if @root.nil?
    current_node = @root
    while current_node.right_node
      current_node = current_node.right_node
    end
    return current_node.value
  end

  def min
    return nil if @root.nil?
    current_node = @root
    while current_node.left_node
      current_node = current_node.left_node
    end
    return current_node.value
  end

  def rsearch(root, value)
    if root.nil?
      return false
    elsif value == root.value
      return true
    elsif value < root.value
      return rsearch(root.left_node, value)
    else
      return rsearch(root.right_node, value)
    end
  end

  def rinsert(root, value)
    if root.nil?
      root = Node.new(value)
    elsif value <= root.value
      root.left_node = rinsert(root.left_node, value)
    else
      root.right_node = rinsert(root.right_node, value)
    end
    return root
  end

  def rmax(root)
    if root.nil?
      return nil
    elsif root.right_node.nil?
      return root.value
    end
    return rmax(root.right_node)
  end

  def rmin(root)
    if root.nil?
      return nil
    elsif root.left_node.nil?
      return root.value
    end
    return rmin(root.left_node)
  end

  def rheight(root)
    if root.nil?
      return -1
    else
      left_height = rheight(root.left_node)
      right_height = rheight(root.right_node)
      return [left_height, right_height].max + 1
    end
  end

  # breadth first traversal
  def bft_print
    if @root.nil?
      return nil
    else
      queue = [@root]
      while !queue.empty?
        queue.push(queue.first.left_node) if queue.first.left_node
        queue.push(queue.first.right_node) if queue.first.right_node
        print queue.shift.value.to_s + " "
      end
    end
  end

  # depth first traversal
  def dft_print(root)
    if root.nil?
      return
    else
      dft_print(root.left_node)
      print root.value.to_s + " "
      dft_print(root.right_node)
    end
  end

  def is_bst?(root, min_value = -Float::INFINITY, max_value = Float::INFINITY)
    return true if root.nil?
    if (root.value > min_value &&
        root.value <= max_value &&
        is_bst?(root.left_node, min_value, root.value) &&
        is_bst?(root.right_node, root.value, max_value))
        return true
    else
      return false
    end
  end

  def next_value(root, value)
    return nil if root.nil?

    if value == root.value
      if root.right_node.nil?
        return nil
      elsif root.right_node
        temp_value = rmin(root.right_node)
      end
    elsif value < root.value
      temp_value = next_value(root.left_node, value)
    else
      temp_value = next_value(root.right_node, value)
    end
    if temp_value.nil?
      temp_value = root.value if root.value > value
    end
    return temp_value
  end

  def rdelete(root, value)
    return root if root.nil?

    if value == root.value
      if root.left_node && root.right_node
        temp_node = rmin_node(root.right_node)
        root.value = temp_node.value
        root.right_node = rdelete(root.right_node, temp_node.value)
      elsif root.left_node
        root.value = root.left_node.value
        root.left_node = root.left_node.left_node
      elsif root.right_node
        root.value = root.right_node.value
        root.right_node = root.right_node.right_node
      elsif root.left_node.nil? && root.right_node.nil?
        root = nil
      end
    elsif value < root.value
      root.left_node = rdelete(root.left_node, value)
    else
      root.right_node = rdelete(root.right_node, value)
    end
    return root
  end

  def rmin_node(root)
    return root if root.left_node.nil?
    return rmin_node(root.left_node)
  end

  # Alternate Version
  # def is_bst?(root)
  #   return true if root.nil?
  #   return (is_subtree_lesser(root.left_node, root.value) &&
  #           is_subtree_greater(root.right_node, root.value) &&
  #           is_bst?(root.left_node) &&
  #           is_bst?(root.right_node))
  # end

  # def is_subtree_lesser(root, parent_value)
  #   return true if root.nil?
  #   return ((root.value <= parent_value) &&
  #           is_subtree_lesser(root.left_node, parent_value) &&
  #           is_subtree_lesser(root.right_node, parent_value))
  # end

  # def is_subtree_greater(root, parent_value)
  #   return true if root.nil?
  #   return ((root.value > parent_value) &&
  #           is_subtree_greater(root.left_node, parent_value) &&
  #           is_subtree_greater(root.right_node, parent_value))
  # end

end

class Node
  attr_accessor :value
  attr_accessor :left_node
  attr_accessor :right_node

  def initialize(value, left_node = nil, right_node = nil)
    @value = value
    @left_node = left_node
    @right_node = right_node
  end
end

tree = BinaryTree.new

# tree.insert(7)
# tree.insert(3)
# tree.insert(1)

# p tree.search(7)
# p tree.search(3)
# p tree.search(1)


# tree.root = tree.rinsert(tree.root, 7)
# tree.root = tree.rinsert(tree.root, 3)
# tree.root = tree.rinsert(tree.root, 1)

# p tree.rsearch(tree.root, 7)
# p tree.rsearch(tree.root, 3)
# p tree.rsearch(tree.root, 1)

# p tree.rmax(tree.root)
# p tree.rmin(tree.root)

# p tree.rheight(tree.root)


# Test tree height
tree.insert(20)
tree.insert(2)
tree.insert(1)
tree.insert(10)
tree.insert(7)
tree.insert(13)
tree.insert(30)
tree.insert(25)
tree.insert(35)

# p tree.rheight(tree.root)

# traversal
tree.dft_print(tree.root)

# p tree.is_bst?(tree.root)

# tree.root = tree.rdelete(tree.root, 20)

p tree.next_value(tree.root,35)