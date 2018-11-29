class Node {
    var value: Int
    var next: Node?
    
    init(value: Int) {
        self.value = value
    }
}

class LinkedList {
    var head: Node?
    
    init(head: Node?) {
        self.head = head
    }
    
    func append(_ node: Node) {
        guard head != nil else {
            head = node
            return
        }
        
        var current = head
        while let _ = current?.next {
            current = current?.next
        }
        current?.next = node
    }
    
    func getNode(atPosition position: Int) -> Node? {
        // assuming first position is 1
        var count = 1
        var current = head
        
        while (count < position) && (current != nil) {
            count = count + 1
            current = current?.next
        }
        return current
    }
    
    func insertNode(_ node: Node, at position: Int) {
        // assuming first position is 1
        var count = 1
        var previous = head
        
        while (count < position - 1) && (previous != nil) {
            count = count + 1
            previous = previous?.next
        }
        
        node.next = previous?.next
        previous?.next = node
    }
    
    func deleteNode(withValue value: Int) {
        var previous: Node?
        var current = head
        
        while (current != nil) && (current?.value != value) {
            previous = current!
            current = current?.next
        }
        
        guard current != nil else {
            return
        }
        
        guard previous != nil else {
            head = head?.next
            return
        }
        
        previous?.next = current?.next
    }
}

// Test cases

// Set up some Nodes
let n1 = Node(value: 1)
let n2 = Node(value: 2)
let n3 = Node(value: 3)
let n4 = Node(value: 4)

// Start setting up a LinkedList
let ll = LinkedList(head: n1)
ll.append(n2)
ll.append(n3)

// Test getNode(atPosition:)
print(ll.head!.next!.next!.value) 
print(ll.getNode(atPosition: 3)!.value)

// Test insert
ll.insertNode(n4, at: 3)
print(ll.getNode(atPosition: 3)!.value)

// Test delete(withValue:)
ll.deleteNode(withValue: 1)
print(ll.getNode(atPosition: 1)!.value)
print(ll.getNode(atPosition: 2)!.value)
print(ll.getNode(atPosition: 3)!.value)
