//: [Previous](@previous)

import Foundation

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

/// 链式地址哈希表
class HashMapChaining {
    var size: Int // 键值对数量
    var capacity: Int // 哈希表容量
    var loadThres: Double // 触发扩容的负载因子阈值
    var extendRatio: Int // 扩容倍数
    var buckets: [[Pair]] // 桶数组
    
    /// 构造方法
    init() {
        size = 0
        capacity = 4
        loadThres = 2.0 / 3.0
        extendRatio = 2
        buckets = Array(repeating: [], count: capacity)
    }
    
    /// 哈希函数
    func hashFunc(key: Int) -> Int {
        key % capacity
    }
    
    /// 负载因子
    func loadFactor() -> Double {
        Double(size / capacity)
    }
    
    /// 查询操作
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // 遍历桶，若找到 key 则返回对应 val
        for pair in bucket {
            if pair.key == key {
                return pair.val
            }
        }
        // 若未找到 key 则返回 nil
        return nil
    }
    
    /// 添加操作
    func put(key: Int, val: String) {
        // 当负载因子超过阈值时，执行扩容
        if loadFactor() > loadThres {
            extend()
        }
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // 遍历桶，若遇到指定 key ，则更新对应 val 并返回
        for pair in bucket {
            if pair.key == key {
                pair.val = val
                return
            }
        }
        // 若无该 key ，将键值对添加至尾部
        let pair = Pair(key: key, val: val)
        buckets[index].append(pair)
        size += 1
    }
    
    /// 删除操作
    func remove(key: Int) {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // 遍历桶，从中删除键值对
        for (pairIndex, pair) in bucket.enumerated() {
            if pair.key == key {
                buckets[index].remove(at: pairIndex)
            }
        }
        size -= 1
    }
    
    /// 扩容哈希表
    func extend() {
        // 暂存原哈希表
        let bucketsTmp = buckets
        // 初始化扩容后的新哈希表
        capacity *= extendRatio
        buckets = Array(repeating: [], count: capacity)
        size = 0
        // 将键值对从原哈希表搬运至新哈希表
        for bucket in bucketsTmp {
            for pair in bucket {
                put(key: pair.key, val: pair.val)
            }
        }
    }
    
    /// 打印哈希表
    func print() {
        for bucket in buckets {
            let res = bucket.map { "\($0.key) -> \($0.val)" }
            Swift.print(res)
        }
    }
}

/// 开放寻址哈希表
class HashMapOpenAddressing {
    var size: Int // 键值对数量
    var capacity: Int // 哈希表容量
    var loadThres: Double // 触发扩容的负载因子阈值
    var extendRatio: Int // 扩容倍数
    var buckets: [Pair?] // 桶数组
    var TOMBSTONE: Pair // 删除标记
    
    /// 构造方法
    init() {
        size = 0
        capacity = 4
        loadThres = 2.0 / 3.0
        extendRatio = 2
        buckets = Array(repeating: nil, count: capacity)
        TOMBSTONE = Pair(key: -1, val: "-1")
    }
    
    /// 哈希函数
    func hashFunc(key: Int) -> Int {
        key % capacity
    }
    
    /// 负载因子
    func loadFactor() -> Double {
        Double(size / capacity)
    }
    
    /// **搜索 key 对应的桶索引**
    func findBucket(key: Int) -> Int {
        var index = hashFunc(key: key)
        var firstTombstone = -1
        // 线性探测，当遇到空桶时跳出
        while buckets[index] != nil {
            // 若遇到 key，则返回对应桶索引
            if buckets[index]?.key == key {
                // 若之前遇到了删除标记，则将键值对移动至该索引
                if firstTombstone != -1 {
                    buckets[firstTombstone] = buckets[index]
                    buckets[index] = TOMBSTONE
                    return firstTombstone // 返回移动后的桶索引
                }
                return index // 返回桶索引
            }
            // 记录遇到的首个删除标记
            if firstTombstone == -1 && buckets[index] == TOMBSTONE {
                firstTombstone = index
            }
            // 计算桶索引，越过尾部返回头部
            index = (index + 1 % capacity)
        }
        // 若 key 不存在，则返回添加点的索引
        return firstTombstone == -1 ? index : firstTombstone
    }
    
    /// 查询操作
    func get(key: Int) -> String? {
        // 搜索 key 对应的桶索引
        let index = findBucket(key: key)
        // 若找到键值对，则返回对应的 val
        let bucket = buckets[index]
        if bucket != nil, bucket != TOMBSTONE {
            return bucket?.val
        }
        // 若键值对不存在，则返回 nil
        return nil
    }
    
    /// 添加操作
    func put(key: Int, val: String) {
        // 当负载因子超过阈值时，执行扩容
        if loadFactor() > loadThres {
            extend()
        }
        // 搜索 key 对应的桶索引
        let index = findBucket(key: key)
        // 若找到键值对，则返回对应的 val
        let bucket = buckets[index]
        if bucket != nil, bucket != TOMBSTONE {
            bucket?.val = val
            return
        }
        // 若键值对不存在，则添加该键值对
        buckets[index] = Pair(key: key, val: val)
        size += 1
    }
    
    /// 删除操作
    func remove(key: Int) {
        // 搜索 key 对应的桶索引
        let index = findBucket(key: key)
        // 若找到键值对，则用删除标记覆盖它
        let bucket = buckets[index]
        if bucket != nil, bucket != TOMBSTONE {
            buckets[index] == TOMBSTONE
            size -= 1
        }
    }
    
    /// 扩容哈希表
    func extend() {
        // 暂存原哈希表
        let bucketsTmp = buckets
        // 初始化扩容后的新哈希表
        capacity *= extendRatio
        buckets = Array(repeating: nil, count: capacity)
        size = 0
        // 将键值对从原哈希表搬运至新哈希表
        for pair in bucketsTmp {
            if let pair, pair != TOMBSTONE {
                put(key: pair.key, val: pair.val)
            }
        }
    }
    
    /// 打印哈希表
    func print() {
        for pair in buckets {
            if pair == nil {
                Swift.print("null")
            } else if pair == TOMBSTONE {
                Swift.print("TOMBSTONE")
            } else {
                Swift.print( "\(pair!.key) -> \(pair!.val)")
            }
        }
    }
}

//: [Next](@next)
