#[
    Problem statement :
        Given a singly linked list, and a number k,
        rotate the linked list to the right k times
]#

import random

type
    Node = ref object
        data : int
        next : Node

# Create a singly linked list of 'n' nodes
proc create_linked_list(n: Natural) : Node =
    var
        s : Node = nil
        t : Node = nil

    for i in countup(1, n):
        new(t)

        # Random data
        t.data = rand(100)
        if s != nil:
            t.next = s
        else:
            t.next = nil
        s = t
    return s

# Output all the nodes of the console
proc print_linked_list(s: Node) =
    var t = s

    while t != nil:
        echo t.data
        t = t.next

# Rotate the list right by k nodes
proc rotate_list_k(s: Node, k: int) : Node =
    # Input validation
    if s == nil or k <= 0:
        return nil

    # start with 2 pointers at the beginning of the list
    var
        t1, t2 = s

    # Position t1 and t2, k-nodes apart
    var i = 0
    while i < k and t2 != nil:
        t2 = t2.next
        inc(i)
    
    if t2 == nil:
        echo "Unable to postion t2 ", k, " nodes apart"
        return nil

    # Move pointers t1 and t2, until t2 reaches last node
    while t2.next != nil:
        t2 = t2.next
        t1 = t1.next

    # Reassign pointers to make it rotated
    # Current last node should point to the start of current list
    t2.next = s

    # New start of the list
    var ns = t1.next

    # t1 is the last node in the list
    t1.next = nil

    return ns

proc main() =
    var 
        start : Node
    
    let n = 10

    start = create_linked_list(n)
    print_linked_list(start)
    start = rotate_list_k(start, 5)
    echo "Rotated List"
    # Another way of calling a function without paranthesis
    print_linked_list start

# There is no real main function that is automatically called
# Any function can be a main entry point into the program.
# need to call it explicitly
main()