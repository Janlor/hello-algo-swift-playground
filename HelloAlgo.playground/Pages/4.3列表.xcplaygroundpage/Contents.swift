//: [Previous](@previous)

import Foundation

// 初始化列表
let nums1: [Int] = []
var nums = [1, 3, 2, 5, 4]

// 访问元素
let num = nums[1]
// 更新元素
nums[1] = 0

// 清空列表
nums.removeAll()

// 尾部添加元素
nums.append(1)
nums.append(3)
nums.append(2)
nums.append(5)
nums.append(4)

// 中间插入元素
nums.insert(6, at: 3)

// 删除元素
nums.remove(at: 3)

// 通过索引遍历列表
var count = 0
for i in nums.indices {
    count += nums[i]
}

// 直接便利列表元素
count = 0
for num in nums {
    count += num
}

// 拼接两个列表
let nums2 = [6, 8, 7, 10, 9]
nums.append(contentsOf: nums2)

// 排序列表
nums.sort()

/// 列表实现

class MyList {
    private var arr: [Int] // 数组（存储列表元素）
    private var _capacity = 10 // 列表容量
    private var _size = 0 // 列表长度（即当前元素数量）
    private let extendRatio = 2 // 每次列表扩容的倍数
    
    /// 构造方法
    init() {
        arr = Array(repeating: 0, count: _capacity)
    }
    
    /// 获取列表长度
    func size() -> Int {
        _size
    }
    
    /// 获取列表容量
    func capacity() -> Int {
        _capacity
    }
    
    /// 访问元素
    func get(index: Int) -> Int {
        if index < 0 || index >= _size {
            fatalError("索引越界")
        }
        return arr[index]
    }
    
    /// 更新元素
    func set(index: Int, num: Int) {
        if index < 0 || index >= _size {
            fatalError("索引越界")
        }
        arr[index] = num
    }
    
    /// 尾部添加元素
    func add(num: Int) {
        if _size == _capacity {
            extendCapacity()
        }
        arr[_size] = num
        _size += 1
    }
    
    /// 中间插入元素
    func insert(index: Int, num: Int)  {
        if index < 0 || index >= _size {
            fatalError("索引越界")
        }
        if _size == _capacity {
            extendCapacity()
        }
        // 讲索引 index 以及之后的元素都向后移动一位
        for j in sequence(first: _size - 1, next: { $0 >= index + 1 ? $0 - 1 : nil }) {
            arr[j + 1] = arr[j]
        }
        arr[index] = num
        _size += 1
    }
    
    /// 删除元素
    @discardableResult
    func remove(at index: Int) -> Int {
        if index < 0 || index >= _size {
            fatalError("索引越界")
        }
        let num = arr[index]
        // 将索引 index 之后的元素都向前移动一位
        for j in index ..< (_size - 1) {
            arr[j] = arr[j + 1]
        }
        _size -= 1
        return num
    }
    
    /// 列表扩容
    func extendCapacity() {
        arr += Array(repeating: 0, count: _capacity * (extendRatio - 1))
        _capacity = arr.count
    }
    
    /// 将列表转换为数组
    func toArray() -> [Int] {
        var arr = Array(repeating: 0, count: _size)
        for i in 0 ..< _size {
            arr[i] = get(index: i)
        }
        return arr
    }
}

//: [Next](@next)
