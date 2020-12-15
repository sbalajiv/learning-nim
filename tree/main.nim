import btree/Btree


proc main() =
  var r = Btree.createBTree(@[3,2,1,823, 98234, -10, -10])
  printTree(r, Ascending)

main()