#[
  Binary tree module
  This is a my way of learning modules in Nim
]#

type
  BNode* = ref object
    value* : int
    left, right : BNode

type
  SortFlag* = enum
    Ascending = 1
    Descending = 2

#[
  Given a node on a tree and a value,
  insert the node
]#
proc insertValueAt(node : BNode, value : int) =
  var t = new(BNode)
  t.value = value
  t.right = nil
  t.left = nil
  if node.value >= value:
    node.left = t
  else:
    node.right = t

#[
  Find the node in the tree, 
  where the value needs to be inserted
]#
proc findNodeToInsert(root : BNode, value : int) : BNode =
  result = root

  while result != nil:
    if result.value >= value:
      if result.left == nil:
        break
      else:
        result = result.left
    else:
      if result.right == nil:
        break
      else:
        result = result.right

#[
  Create a binary search tree with list of integers
]#
proc createBTree*(s : seq[int]) : BNode =
  if s.len() == 0:
    return nil
  
  var root = new(BNode)
  root.left = nil
  root.right = nil
  
  if len(s) > 1:
    # Choose the middle element of the list as root node
    var idx = len(s) div 2

    root.value = s[idx]

    # Loop through the list and create the tree
    for i,v in s:
      if i == idx:
        continue
      # Find the position in the binary search tree
      var t = findNodeToInsert(root, v)

      # Insert the node
      if t != nil:
        insertValueAt(t, v)
      else:
        echo("Unable to find place to insert the node")
        break
  else:
    root.value = s[0]

  return root

#[
  In-order traverse the tree and print the nodes
]#
proc printTreeAscending(root : BNode) =
  if root == nil:
    return

  printTreeAscending(root.left)
  stdout.write(root.value, " ")
  printTreeAscending(root.right)

#[
  Post-order traverse the tree and print the nodes
]#
proc printTreeDescending(root : BNode) =
  if root == nil:
    return

  printTreeDescending(root.right)
  stdout.write(root.value, " ")
  printTreeDescending(root.left)

#[
  Display sorted tree nodes based on sort flag
]#
proc printTree*(root : BNode, flag : SortFlag) =
  if root == nil:
    return

  case flag:
    of Ascending:
      printTreeAscending(root)
    of Descending:
      printTreeDescending(root)
  stdout.write("\n")
