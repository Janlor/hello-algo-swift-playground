//: [Previous](@previous)

import Foundation

// Swift 没有内置的双向队列类，可以把 Array 当作队来使用
var deque: [Int] = []

// 元素入队
deque.append(2) // 添加至队尾
deque.append(5)
deque.append(4)
deque.insert(3, at: 0) // 添加至队首
deque.insert(1, at: 0)

// 访问队首元素
let peekFirst = deque.first // 队首元素
let peekLast = deque.last // 队尾元素

// 元素出队
// 使用 Array 模拟时 popFirst 复杂度为 O(n)
let popFirst = deque.removeFirst() // 队首元素出队
let popLast = deque.removeLast() // 队尾元素出队

// 获取双向队列的长度
let size = deque.count

// 判断双向队列是否为空
let isEmpty = deque.isEmpty

/// ------ 基于双向链表实现的队列 ------

/// 链表节点类
class ListNode {
    var val: Int // 节点值
    var next: ListNode? // 后继节点引用
    weak var prev: ListNode? // 前驱节点引用
    
    init(val: Int) { // 构造函数
        self.val = val
    }
}

/// 基于双向链表实现的队列
class LinkedListDeque {
    private var front: ListNode? // 头节点
    private var rear: ListNode? // 尾节点
    private var queSize: Int // 双向队列的长度
    
    init() { 
        queSize = 0
    }
    
    /// 获取双向队列的长度
    func size() -> Int {
        queSize
    }
    
    /// 判断对了是否为空
    func isEmpty() -> Bool {
        size() == 0
    }
    
    /// 入队操作
    private func push(num: Int, isFront: Bool) {
        let node = ListNode(val: num)
        // 如果链表为空，则令 front、rear 都指向 node
        if isEmpty() {
            front = node
            rear = node
        } else if isFront { // 队首入队操作
            // 将 node 添加到链表头部
            front?.prev = node
            node.next = front
            front = node // 更新头节点
        } else { // 队尾入队操作
            // 将 node 添加到链表尾部
            rear?.next = node
            node.prev = rear
            rear = node // 更新尾节点
        }
        queSize += 1 // 更新队列长度
    }
    
    /// 队首入队
    func pushFirst(num: Int) {
        push(num: num, isFront: true)
    }
    
    /// 队尾入队
    func pushLast(num: Int) {
        push(num: num, isFront: false)
    }
    
    /// 出队
    @discardableResult
    private func pop(isFront: Bool) -> Int {
        if isEmpty() {
            fatalError("双向队列为空")
        }
        let val: Int
        if isFront { // 队首出队操作
            val = front!.val // 暂存头节点值
            // 删除头节点
            let fNext = front?.next
            if fNext != nil {
                fNext?.prev = nil
                fNext?.next = nil
            }
            front = fNext // 更新头节点
        } else { // 队尾出队操作
            val = rear!.val // 暂存尾节点值
            // 删除尾节点
            let rPrev = rear?.prev
            if rPrev != nil {
                rPrev?.next = nil
                rPrev?.prev = nil
            }
            rear = rPrev // 更新尾节点
        }
        queSize -= 1 // 更新队列长度
        return val
    }
    
    /// 队首出队
    func popFirst() -> Int {
        pop(isFront: true)
    }
    
    /// 队尾出队
    func popLast() -> Int {
        pop(isFront: false)
    }
    
    /// 访问队首元素
    func peekFirst() -> Int? {
        isEmpty() ? nil : front?.val
    }
    
    /// 访问队尾元素
    func peekLast() -> Int? {
        isEmpty() ? nil : rear?.val
    }
    
    /// 返回数组用于打印
    func toArray() -> [Int] {
        var node = front
        var res = Array(repeating: 0, count: queSize)
        for i in res.indices {
            res[i] = node!.val
            node = node?.next
        }
        return res
    }
}

/// 基于环形数组实现的队列
class ArrayDeque {
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
    
    /// 计算环形数组索引
    private func index(i: Int) -> Int {
        // 通过取余操作实现数组首尾相连
        // 当 i 越过数组尾部后，回到头部
        // 当 i 越过数组头部后，回到尾部
        (i + capacity()) % capacity()
    }
    
    /// 队首入队
    func pushFirst(num: Int) {
        if size() == capacity() {
            print("双向队列已满")
            return
        }
        // 队首指针向左移动一位
        // 通过取余操作，实现 front 越过数组头部后回到尾部
        front = index(i: front - 1)
        // 将 num 添加至队首
        nums[front] = num
        queSize += 1
    }
    
    /// 队尾入队
    func pushLast(num: Int) {
        if size() == capacity() {
            print("双向队列已满")
            return
        }
        // 计算尾指针，指向队尾索引 + 1
        let rear = index(i: front + size())
        // 将 num 添加至队尾
        nums[rear] = num
        queSize += 1
    }
    
    /// 队首出队
    func popFirst() -> Int {
        let num = peekFirst()
        // 队首指针向后移动一位
        front = index(i: front + 1)
        queSize -= 1
        return num
    }
    
    /// 队尾出队
    func popLast() -> Int {
        let num = peekLast()
        queSize -= 1
        return num
    }
    
    /// 访问队首元素
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("双向队列为空")
        }
        return nums[front]
    }
    
    /// 访问队尾元素
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("双向队列为空")
        }
        // 计算尾元素索引
        let last = index(i: front + size() - 1)
        return nums[last]
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
