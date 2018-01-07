
def kth_largest(tree_node, k)
  arr = in_order_traversal(tree_node, [])
  arr[(k*-1)]
end

def in_order_traversal(tree_node = @root, arr = [])
  if tree_node.nil? 
    return 
  end 
  if tree_node.left.nil? && tree_node.right.nil? 
    arr << tree_node
    return
  end 
  if tree_node.left
    in_order_traversal(tree_node.left, arr) 
  end 
  arr << tree_node
  if tree_node.right
    in_order_traversal(tree_node.right, arr)
  end 
  arr
end
