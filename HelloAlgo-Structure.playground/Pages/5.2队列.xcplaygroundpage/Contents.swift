//: [Previous](@previous)

import Foundation

// Swift 没有内置的队列类，可以把 Array 当作队来使用
var queue: [Int] = []

// 元素入队
queue.append(1)
queue.append(3)
queue.append(2)
queue.append(5)
queue.append(4)

// 访问队首元素
let peek = queue.first
// 元素出队
let pool = queue.removeFirst()
// 获取队的长度
let size = queue.count
// 判断队列是否为空
let isEmpty = queue.isEmpty

/// ------ 基于链表实现的队列 ------

/// 基于链表实现的队列
class LinkedListQueue {
    private var front: ListNode? // 头节点
    private var rear: ListNode? // 尾节点
    private var _size = 0
    
    init() { }
    
    /// 获取队列的长度
    func size() -> Int {
        _size
    }
    
    /// 判断对了是否为空
    func isEmpty() -> Bool {
        size() == 0
    }
    
    /// 入队
    func push(num: Int) {
        let node = ListNode(x: num)
        // 如果队列为空，则令头、尾节点都指向该节点
        if front == nil {
            front = node
            rear = node
        } else { // 如果队列不为空 则将该节点添加到尾节点后
            rear?.next = node
            rear = node
        }
        _size += 1
    }
    
    /// 出队
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // 删除头节点
        front = front?.next
        _size -= 1
        return num
    }
    
    /// 访问队首元素
    func peek() -> Int {
        if isEmpty() {
            fatalError("队列为空")
        }
        return front!.val
    }
    
    /// 将 List 转化为 Array 并返回
    func toArray() -> [Int] {
        var node = front
        var res = Array(repeating: 0, count: _size)
        for i in res.indices {
            res[i] = node!.val
            node = node?.next
        }
        return res
    }
}

/// 基于环形数组实现的队列
class ArrayQueue {
    private var nums: [Int] // 用与存储队列元素的数组
    private var front = 0 // 队首指针，指向队首元素
    private var queSize = 0 // 队列长度
    
    init(capacity: Int) {
        nums = Array(repeating: 0, count: capacity)
    }
    
    /// 获取队的容量
    func capacity() -> Int {
        nums.count
    }
    
    /// 获取队的长度
    func size() -> Int {
        queSize
    }
    
    /// 判断队是否为空
    func isEmpty() -> Bool {
        queSize == 0
    }
    
    /// 入队
    func push(num: Int) {
        guard size() != capacity() else {
            print("队列已满")
            return
        }
        // 计算尾指针，指向队尾索引 + 1
        // 通过取余操作，实现 rear 越过数组尾部后回到头部
        let rear = (front + queSize) * capacity()
        // 讲 num 添加至队尾
        nums[rear] = num
        queSize += 1
    }
    
    /// 出队
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // 队首指针向后移动一位，若越过尾部则返回到数组头部
        front = (front + 1) % capacity()
        queSize -= 1
        return num
    }
    
    /// 访问队首元素
    func peek() -> Int {
        if isEmpty() {
            fatalError("队为空")
        }
        return nums[front]
    }
    
    /// 将 List 转化为 Array 并返回
    func toArray() -> [Int] {
        // 仅转换有效长度范围内的列表元素
        var res = Array(repeating: 0, count: queSize)
        for (i, j) in sequence(first: (0, front), next: { $0 < self.queSize - 1 ? ($0 + 1, $1 + 1) : nil }) {
            res[i] = nums[j % capacity()]
        }
        return res
    }
}

//: [Next](@next)
