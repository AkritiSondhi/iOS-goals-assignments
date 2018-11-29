class Node {
    var value: Int
    var next: Node?
    
    init(value: Int) {
        self.value = value
    }
}

class Stack {
    var top: Node?
    
    init(top: Node?) {
        self.top = top
    }
    
    func push(_ node: Node) {
        guard top != nil else {
            top = node
            return
        }
        
        node.next = top
        top = node
    }
    
    func pop() -> Node? {
        guard top != nil else {
            return nil
        }
        
        let oldTop = top
        top = top?.next
        
        return oldTop
    }
}
// Test cases
// Set up some nodes
let n1 = Node(value: 1)
let n2 = Node(value: 2)
let n3 = Node(value: 3)
let n4 = Node(value: 4)

// Start setting up a Stack
let stack = Stack(top: n1)

// Test stack functionality
stack.push(n2)
stack.push(n3)
print(stack.pop()!.value) // Should be 3
print(stack.pop()!.value) // Should be 2
print(stack.pop()!.value) // Should be 1
//print(stack.pop()?.value) // Should be nil
stack.push(n4)
print(stack.pop()!.value) // Should be 4
