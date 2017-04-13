# Red Black Tree

class RedBlackTree
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

  def insert(parent,value,root=@root)
    if root.nil?
      # if parent is not null, it means tree is not empty
      # so create red node
      if !parent.nil?
        return Node.new(value,"red",parent)
      else
        # tree root
        return Node.new(value,"black",parent)
      end
    end

    # if we go left, isLeft will be true
    # if we go right, isLeft will be false
    isLeft = nil

    if root.value > value
      left = insert(root,value,root.left_node)
      # if left is same as root.parent that means rotation
      # happend at lower level. So just return left so
      # that nodes at uppper level can be set thier child
      # correctly.
      if left == root.parent_node
        return left
      end
      root.left_node = left
      isLeft = true
    else
      right = insert(root,value,root.right_node)
      # if right is same as root.parent that means rotation
      # happend at lower level. So just return right so
      # that nodes at uppper level can be set thier child
      # correctly.
      if right == root.parent_node
        return right
      end
      root.right_node = right
      isLeft = false
    end

    if isLeft
      # If let, check for Red-Red conflict. 
      if root.color == "red" && root.left_node.color == "red"
        sibling = find_sibling(root)

        if sibling.nil? || sibling.color == "black" 
          if left_child?(root)
            # LEFT-LEFT
            right_rotate(root,true)
          else
            # LEFT-RIGHT
            # Do right rotate without change in color.
            # After rotate root becomes right child of its
            # left child. So make root equal to root.parent because
            # its left child before rotation is new root of this subtree.
            right_rotate(root.left_node,false)
            root = root.parent_node
            left_rotate(root,true)
          end
        else
          # We have sibling color as red. Change color of root and its sibling
          # to black and change color of their parent to red it not root. 
          root.color = "black"
          sibling.color = "black"
          if !root.parent_node.parent_node.nil?
            root.parent_node.color = "red"
          end
        end
      end
    else
      if root.color == "red" && root.right_node.color == "red"
        sibling = find_sibling(root)
        if sibling.nil? || sibling.color == "black" 
          if !left_child?(root)
            left_rotate(root,true)
          else
            left_rotate(root.right_node,false)
            root = root.parent_node
            right_rotate(root,true)
          end
        else
          root.color = "black"
          sibling.color = "black" if sibling
          if !root.parent_node.parent_node.nil?
            root.parent_node.color = "red"
          end
        end
      end
    end

    return root
  end

  def find_sibling(root)
    return nil if root.parent_node.nil?
    if left_child?(root)
      return root.parent_node.right_node 
    else
      return root.parent_node.left_node
    end
  end

  def left_child?(root)
    return nil if root.parent_node.nil?
    return root.parent_node.left_node == root
  end

  def left_rotate(root,changeColor)
    parent = root.parent_node
    root.parent_node = parent.parent_node
    if !parent.parent_node.nil?
      if parent.parent_node.right_node == parent
        parent.parent_node.right_node = root
      else
        parent.parent_node.left_node = root
      end
    end
    left = root.left_node
    root.left_node = parent
    parent.parent_node = root
    parent.right_node = left
    if !left.nil?
      left.parent_node = parent
    end
    if changeColor
      root.color = "black"
      parent.color = "red"
    end
  end

  def right_rotate(root,changeColor)
    parent = root.parent_node
    root.parent_node = parent.parent_node
    if !parent.parent_node.nil?
      if parent.parent_node.right_node == parent
        parent.parent_node.right_node = root
      else
        parent.parent_node.left_node = root
      end
    end
    right = root.right_node
    root.right_node = parent
    parent.parent_node = root
    parent.left_node = right
    if !right.nil?
      right.parent_node = parent
    end
    if changeColor
      root.color = "black"
      parent.color = "red"
    end
  end

  # BF-Traversal
  def print_values1(root=@root, queue=[])
    if root
      puts "Value:#{root.value}, Color:#{root.color}, Parent: #{root.parent_node ? root.parent_node.value : 'nil'},"\
      " Left: #{root.left_node ? root.left_node.value : 'nil'}, Right: #{root.right_node ? root.right_node.value : 'nil'}"
      queue.push(root.left_node) if root.left_node
      queue.push(root.right_node) if root.right_node
      print_values1(queue.shift,queue)
    end
  end

  def delete(root=@root,value)
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

  def delete_one_child(node)
    child = node.right_node.nil? ? node.left_node : node.right_node
    replace_node(node,child)
  end

  def replace_node(root,child)
    child.parent_node = root.parent_node
    if root.parent_node.nil?
      
    else

    end
  end
end

class Node
  attr_accessor :value
  attr_accessor :left_node
  attr_accessor :right_node
  attr_accessor :parent_node
  attr_accessor :color

  def initialize(value=nil,color=nil,parent_node=nil,left_node=nil,right_node=nil)
    @value = value
    @color = color
    @parent_node = parent_node
    @left_node = left_node
    @right_node = right_node
  end
end