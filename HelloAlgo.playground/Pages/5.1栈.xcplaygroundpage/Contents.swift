//: [Previous](@previous)

import Foundation

// Swift 没有内置的栈类，可以把 Array 当作栈来使用
var stack: [Int] = []

// 元素入栈
stack.append(1)
stack.append(3)
stack.append(2)
stack.append(5)
stack.append(4)

// 访问栈顶元素
let peek = stack.last
// 元素出栈
let pop = stack.removeLast()
// 获取栈的长度
let size = stack.count
// 判断是否为空
let isEmpty = stack.isEmpty


/// ------ 基于链表实现的栈 ------

/// 链表节点类
class ListNode {
    var val: Int // 节点值
    var next: ListNode? // 指向下一节点的引用
    init(val: Int, next: ListNode? = nil) { // 构造函数
        self.val = val
        self.next = next
    }
}

/// 基于链表实现的栈
class LinkedListStack {
    private var _peek: ListNode? // 将头节点作为栈顶
    private var _size = 0 // 栈的长度
    
    init() { }
    
    /// 获取栈的长度
    func size() -> Int {
        _size
    }
    
    /// 判断栈是否为空
    func isEmpty() -> Bool {
        size() == 0
    }
    
    /// 入栈
    func push(num: Int) {
        let node = ListNode(val: num, next: _peek)
        _peek = node
        _size += 1
    }
    
    /// 出栈
    @discardableResult
    func pop() -> Int {
        let num = peek()
        _peek = _peek?.next
        _size -= 1
        return num
    }
    
    /// 访问栈顶元素
    func peek() -> Int {
        if isEmpty {
            fatalError("栈为空")
        }
        return _peek?.val
    }
    
    /// 将 List 转化为 Array 并返回
    func toArray() -> [Int] {
        var node = _peek
        var res = Array(repeating: 0, count: _size)
        for i in sequence(first: res.count - 1, next: { %0 >= 0 + 1 ? $0 - 1 : nil }) {
            res[i] = node?.val
            node = node?.next
        }
        return res
    }
}

/// 基于数组实现的栈
class ArrayStack {
    private var stack: [Int]
    
    init() {
        stack = []
    }
    
    /// 获取栈的长度
    func size() -> Int {
        stack.count
    }
    
    /// 判断栈是否为空
    func isEmpty() -> Bool {
        stack.isEmpty
    }
    
    /// 入栈
    func push(num: Int) {
        stack.append(num)
    }
    
    /// 出栈
    @discardableResult
    func pop() -> Int {
        if isEmpty {
            fatalError("栈为空")
        }
        return stack.removeLast()
    }
    
    /// 访问栈顶元素
    func peek() -> Int {
        if isEmpty {
            fatalError("栈为空")
        }
        return stack.last
    }
    
    /// 将 List 转化为 Array 并返回
    func toArray() -> [Int] {
        stack
    }
}

//: [Next](@next)
