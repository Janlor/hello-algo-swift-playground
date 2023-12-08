//: [Previous](@previous)

import Foundation

// 初始化哈希表
var map: [Int: String] = [:]

// 添加
map[12836] = "小哈"
map[15937] = "小啰"
map[16750] = "小算"
map[13276] = "小法"
map[10583] = "小鸭"

// 查询
let name = map[15937]

//删除
map.removeValue(forKey: 10583)

/* ---------- */

// 循环
func loop() {
    // 遍历键值对
    for (key, value) in map {
        print("\(key) -> \(value)")
    }
    
    // 单独遍历键
    for key in map.keys {
        print(key)
    }
    
    // 单独遍历值
    for value in map.values {
        print(value)
    }
}

/* ---------- */

class Pair: Equatable {
    var key: Int
    var val: String
    
    init(key: Int, val: String) {
        self.key = key
        self.val = val
    }
    
    static func == (lhs: Pair, rhs: Pair) -> Bool {
        lhs.key == rhs.key && lhs.val == rhs.val
    }
}

class ArrayHashMap {
    private var buckets: [Pair?] = []
    private let capacity: Int = 100
    
    init() {
        buckets = Array(repeating: nil, count: capacity)
    }
    
    func hashFunc(key: Int) -> Int {
        let index = key % capacity
        return index
    }
    
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let pair = buckets[index]
        return pair?.val
    }
    
    func put(key: Int, val: String) {
        let index = hashFunc(key: key)
        let pair = Pair(key: key, val: val)
        buckets[index] = pair
    }
    
    func remove(key: Int) {
        let index = hashFunc(key: key)
        buckets[index] = nil
    }
    
    func pairSet() -> [Pair] {
        return buckets.compactMap { $0 }
    }
    
    func keySet() -> [Int] {
        return buckets.compactMap { $0?.key }
    }
    
    func valueSet() -> [String] {
        return buckets.compactMap { $0?.val }
    }
    
    func print() {
        for pair in pairSet() {
            Swift.print("\(pair.key) -> \(pair.val)")
        }
    }
}

let hashMap = ArrayHashMap()
hashMap.put(key: 123, val: "哈哈")
hashMap.put(key: 124, val: "呵呵")
hashMap.get(key: 123)
hashMap.keySet()
hashMap.valueSet()
hashMap.print()

//: [Next](@next)
