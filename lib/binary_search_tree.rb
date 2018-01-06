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
    
    else 
      if node.parent 
        parent = node.parent 
        if (node.value <= parent.value)
          puts "here"
          parent.left = nil
        else 
          puts "here"
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
  end

  def depth(tree_node = @root)
  end 

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:

end
