//: [Previous](@previous)

import Foundation

class Node {
    var value: Int
    var next: Node?
    
    init(value: Int) {
        self.value = value
    }
}

class Queue {
    
    var head: Node?
    var tail: Node?
    
    init(head: Node?) {
        self.head = head
        self.tail = head
    }
    
    func enqueue(_ element: Int) {
        let nodeToEnqueue = Node.init(value: element)
        
        guard head != nil else {
            head = nodeToEnqueue
            tail = nodeToEnqueue
            return
        }
        
        tail?.next = nodeToEnqueue
        tail = nodeToEnqueue
    }

    func peek() -> Int? {
        guard head != nil else {
            return nil
        }
        return head?.value
    }
    
    func dequeue() -> Int? {
        guard head != nil else {
            return nil
        }
        let deletedNode = head
        head = head?.next
        return deletedNode?.value
    }
}


// Test cases

// Setup
var q = Queue(head: Node(value: 1))
q.enqueue(2)
q.enqueue(3)

// Test peek
print(q.peek()!) // Should be 1

// Test dequeue
print(q.dequeue()!) // Should be 1

// Test enqueue
q.enqueue(4)
print(q.dequeue()!) // Should be 2
print(q.dequeue()!) // Should be 3
print(q.dequeue()!) // Should be 4
q.enqueue(5)
print(q.peek()!) // Should be 5
//: [Next](@next)
