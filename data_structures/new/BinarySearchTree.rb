# Binary Tree

class BinarySearchTree
  attr_accessor :root

  def inititialize
    @root = nil
  end

  # Iterative Search
  def search1(value)
    current_node = @root

    while current_node
      if value == current_node.value
        return true
      elsif value < current_node.value
        current_node = current_node.left_node
      else
        current_node = current_node.right_node
      end
    end

    return false
  end

  # Recursive Search
  def search2(value,root=@root)
    return false if root.nil?

    if value == root.value
      return true 
    elsif value < root.value
      return search2(value,root.left_node)
    else
      return search2(value,root.right_node)
    end
  end

  # Iterative Insert
  def insert1(value)
    if @root
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
          end
          current_node = current_node.right_node
        end
      end
    else
      @root = Node.new(value) 
    end

    return value
  end

  # Recursive Insert
  def insert2(value,root=@root)
    if root.nil?
      @root = Node.new(value)
      return @root
    end

    if value <= root.value
      root.left_node = insert2(value,root.left_node)
    else
      root.right_node = insert2(value,root.right_node)
    end

    @root = root
    return @root
  end

  # Iterative Max
  def max1
    current_node = @root

    return nil if current_node.nil?

    while current_node.right_node
      current_node = current_node.right_node
    end

    return current_node.value
  end

  # Recursive Max
  def max2(root=@root)
    return nil if root.nil?
    return root.value if root.right_node.nil?
    return max2(root.right_node)
  end

  # Iterative Min
  def min1
    current_node = @root

    return nil if current_node.nil?

    while current_node.left_node
      current_node = current_node.left_node
    end

    return current_node.value
  end

  # Recursive Min
  def min2(root=@root)
    return nil if root.nil?
    return root.value if root.left_node.nil?
    return max2(root.left_node)
  end

  # Recursive Height
  def height(root=@root)
    return -1 if root.nil?

    left_height = height(root.left_node)
    right_height = height(root.right_node)
    return [left_height, right_height].max+1
  end

  # BF-Traversal
  def print_values1(root=@root, queue=[])
    if root
      print "#{root.value} "
      queue.push(root.left_node) if root.left_node
      queue.push(root.right_node) if root.right_node
      print_values1(queue.shift,queue)
    end
  end

  # DF-Traversal
  def print_values2(root=@root)
    if root
      print_values2(root.left_node)
      print "#{root.value} "
      print_values2(root.right_node)
    end
  end

  # Recursive BST?
  def bst?(root=@root)
    if root
      if root.left_node
        return false if root.value < root.left_node.value
        return bst?(root.left_node)
      end

      if root.right_node
        return false if root.value > root.right_node.value
        return bst?(root.right_node)
      end
    end
    return true 
  end

  # Recursive Next Value
  def next_value(value,root=@root)
    return nil if root.nil?

    if value == root.value
      if root.right_node.nil?
        return nil
      elsif root.right_node
        temp_value = min2(root.right_node)
      end
    elsif value < root.value
      temp_value = next_value(value,root.left_node)
    else
      temp_value = next_value(value,root.right_node)
    end
    if temp_value.nil?
      temp_value = root.value if root.value > value
    end
    return temp_value
  end

  # Recursive Delete
  def delete(value,root=@root)
    return root if root.nil?

    if value == root.value
      if root.left_node.nil? && root.right_node.nil?
        root = nil
      elsif root.left_node && root.right_node
        root.value = min2(root.right_node)
        delete(root.value,root.right_node)
      elsif root.left_node
        root.value = root.left_node.value
        root.left_node = root.left_node.left_node
      else
        root.value = root.right_node.value
        root.right_node = root.right_node.right_node
      end
    elsif value < root.value
      root.left_node = delete(value,root.left_node)
    else
      root.right_node = delete(value,root.right_node)
    end

    @root = root
    return root
  end

  # Recursive Min_Node
  def min_node(root=@root)
    return nil if root.nil?
    return root if root.left_node.nil?
    return min_node(root.left_node)
  end
end

class Node
  attr_accessor :value
  attr_accessor :left_node
  attr_accessor :right_node

  def initialize(value=nil,left_node=nil,right_node=nil)
    @value = value
    @left_node = left_node
    @right_node = right_node
  end
end