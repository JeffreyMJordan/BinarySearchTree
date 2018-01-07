# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.
require 'bst_node'
require 'byebug'

class BinarySearchTree

  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    if @root == nil 
      @root = BSTNode.new(value)
      return @root
    end
    
    curr = @root
    prev = nil
    left = false 
    right = false
    until curr.nil? 
      prev = curr
      if value <= curr.value 
        left, right = true, false
        curr = curr.left
      else 
        right, left = true, false
        curr = curr.right 
      end 
    end 
    new_node = BSTNode.new(value)
    if left
      prev.left = new_node
      new_node.parent = prev
    else 
      prev.right = new_node
      new_node.parent = prev
    end 

  end

  def find(value, tree_node = @root)
    if tree_node.nil? 
      nil
    elsif tree_node.value == value
      tree_node
    elsif value<=tree_node.value 
      find(value, tree_node.left)
    else 
      find(value, tree_node.right)
    end 
  end

  #Find the node that is the biggest thing in the node's left subtree, replace the node with it
  #If the replacement node has a left child, then make it the right child of the prev node
  def delete(value)
    node = find(value, @root)
    if node.left || node.right 
      if node.left && node.right 
        max = maximum(node.left)
        if max.left 
          max.parent.right = max.left 
          max.left = nil
        end
        node.left.parent = max 
        node.right.parent = max
        if (node.value <= node.parent.value)
          node.parent.left = max
        else 
          node.parent.right = max
        end 
      else 
        replacement_node = node.left ? node.left : node.right 
        parent = node.parent
        if replacement_node.value <= parent.value 
          parent.left = replacement_node
        else 
          parent.right = replacement_node
        end 
      end 
    else 
      if node.parent 
        parent = node.parent 
        if (node.value <= parent.value)
          parent.left = nil
        else 
          parent.right = nil
        end
      else 
        @root = nil 
        nil
      end 
    end 
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    curr = tree_node
    until curr.right.nil? 
      curr = curr.right
    end
    curr 
  end

  def depth(tree_node = @root)
    arr = []
    depth_helper(tree_node, arr, 0)
    arr.max
  end 

  #Balanced if difference in depth of left and right subtrees is at most 1 
  #Both left and right are balanced BSTs
  def is_balanced?(tree_node = @root)
    # byebug
    return true if tree_node.nil?
    left_depth = tree_node.left ? depth(tree_node.left) : -1 
    right_depth = tree_node.right ? depth(tree_node.right) : -1
    if ((left_depth - right_depth).abs <=1) && is_balanced?(tree_node.left) && is_balanced?(tree_node.right)
      return true 
    end 
    false
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:
  def depth_helper(node, arr, depth)
    if node.left.nil? && node.right.nil? 
      arr << depth
      return
    else 
      depth += 1 
      if node.left
        depth_helper(node.left, arr, depth) 
      end 
      if node.right
        depth_helper(node.right, arr, depth)
      end 
    end 
  end

end
