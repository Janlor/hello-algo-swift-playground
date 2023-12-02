//: [Previous](@previous)

import Foundation

/// 链表节点类
class ListNode {
    var val: Int // 节点值
    var next: ListNode? // 指向下一节点的引用
    init(val: Int, next: ListNode? = nil) { // 构造函数
        self.val = val
        self.next = next
    }
}

/// 1. 初始化链表

// 初始化各个节点
let n0 = ListNode(val: 1)
let n1 = ListNode(val: 3)
let n2 = ListNode(val: 2)
let n3 = ListNode(val: 5)
let n4 = ListNode(val: 4)
// 构建引用指向
n0.next = n1
n1.next = n2
n2.next = n3
n3.next = n4


/// 2. 插入节点

func insert(n0: ListNode, P: ListNode) {
    let n1 = n0.next
    P.next = n1
    n0.next = P
}

/// 3. 删除节点

func remove(n0: ListNode) {
    let P = n0.next
    let n1 = P?.next
    n0.next = n1
    P?.next = nil
}

/// 4. 访问节点

func access(head: ListNode, index: Int) -> ListNode? {
    var head: ListNode? = head
    for _ in 0 ..< index {
        if head == nil {
            return nil
        }
        head = head?.next
    }
    return head
}

/// 5. 查找节点

func find(head: ListNode, target: Int) -> Int {
    var head: ListNode? = head
    var index = 0
    while head != nil {
        if head?.val == target {
            return index
        }
        head = head?.next
        index += 1
    }
    return -1
}

/// 双向链表

class ListNode2 {
    var val: Int // 节点值
    var next: ListNode? // 指向后继节点的引用
    var prev: ListNode? // 指向前驱节点的引用
    
    init(val: Int, next: ListNode? = nil, prev: ListNode? = nil) {
        self.val = val
        self.next = next
        self.prev = prev
    }
}

//: [Next](@next)
