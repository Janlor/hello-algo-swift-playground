//: [Previous](@previous)

import Foundation

func algorithm(n: Int) {
    var a = 2
    a = a + 1
    a = a * 2
    for _ in 0 ..< n {
        print(0)
    }
}

/// 常数阶
func algorithmA(n: Int) {
    print(0)
}

/// 线性阶
func algorithmB(n: Int) {
    for _ in 0 ..< n {
        print(0)
    }
}

/// 常数阶
func algorithmC(n: Int) {
    for _ in 0 ..< 1000000 {
        print(0)
    }
}

func algorithm1(n: Int) {
    var a = 1 // +0
    a = a + n // +0
    
    // +n
    for _ in 0 ..< (5 * n + 1) {
        print(0)
    }
    
    // +n*n
    for _ in 0 ..< (2 * n) {
        for _ in 0 ..< (n + 1) {
            print(0)
        }
    }
}

/// 常数阶
func constant(n: Int) -> Int {
    var count = 0
    let size = 100_000
    for _ in 0 ..< size {
        count += 1
    }
    return count
}
//constant(n: 100)

/// 线性阶
func linear(n: Int) -> Int {
    var count = 0
    for _ in 0 ..< n {
        count += 1
    }
    return count
}
//linear(n: 100)

/// 线性阶（遍历数组）
func arrayTraversal(nums: [Int]) -> Int {
    var count = 0
    for _ in nums {
        count += 1
    }
    return count
}
//arrayTraversal(nums: [1, 2, 3, 4, 5])

/// 平方阶
func quadratic(n: Int) -> Int {
    var count = 0
    for _ in 0 ..< n {
        for _ in 0 ..< n {
            count += 1
        }
    }
    return count
}
//quadratic(n: 100)

/// 平方阶（冒泡排序）
func bubbleSort(nums: inout [Int]) -> Int {
    var count = 0
    // 外循环：未排区间为 [0, i]
    for i in stride(from: nums.count - 1, to: 0, by: -1) {
//        print("i \(i)")
        // 内循环：将未排序区间[0, i]中的最大元素交换至该区间最右端
        for j in 0 ..< i {
//            print("j \(j)")
            if nums[j] > nums[j + 1] {
                // 交换 nums[j] 与 nums[j + 1]
                let tmp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
                count += 3
            }
//            print("nums \(nums)")
        }
    }
    return count
}
//var array = [2, 5, 1, 8, 4, 3]
//bubbleSort(nums: &array)

/// 指数阶（循环实现）
func exponential(n: Int) -> Int {
    var count = 0
    var base = 1
    // 细胞每轮一分为二，形成数列 1， 2， 4， 8， ...，2^(n-1)
    for _ in 0 ..< n {
        for _ in 0 ..< base {
            count += 1
        }
        base *= 2
    }
    return count
}
//exponential(n: 3)

/// 指数阶（递归实现）
func expRecur(n: Int) -> Int {
    if n == 1 {
        return 1
    }
    return expRecur(n: n - 1) + expRecur(n: n - 1) + 1
}
//expRecur(n: 3)

/// 对数阶（循环实现）
func logarithmic(n: Double) -> Int {
    var count = 0
    var n = n
    while n > 1 {
        n /= 2
        count += 1
    }
    return count
}
//logarithmic(n: 8)

/// 对数阶（递归实现）
func logRecur(n: Double) -> Int {
    if n <= 1 {
        return 0
    }
    return logRecur(n: n / 2) + 1
}
//logRecur(n: 8)

/// 线性对数阶（递归实现）
func linearLogRecur(n: Double) -> Int {
    if n <= 1 {
        return 1
    }
    var count = linearLogRecur(n: n / 2) + linearLogRecur(n: n / 2)
    for _ in stride(from: 0, to: n, by: 1) {
        count += 1
    }
    return count
}
//linearLogRecur(n: 8)

/// 阶乘阶（递归实现）
func factorialRecur(n: Int) -> Int {
    if n == 0 {
        return 1
    }
    var count = 0
    // 从 1 分裂出 n 个
    for _ in 0 ..< n {
        count += factorialRecur(n: n - 1)
    }
    return count
}
//factorialRecur(n: 4)

/// 生成一个数组，元素为 { 1, 2, ..., n }, 顺序被打乱
func randomNumber(n: Int) -> [Int] {
    var nums = Array(1 ... n)
    nums.shuffle()
    return nums
}
//randomNumber(n: 10)

/// 查找数组 nums 中数字 1 所在索引
func findOne(nums: [Int]) -> Int {
    for i in nums.indices {
        if nums[i] == 1 {
            return i
        }
    }
    return -1
}

//let nums = randomNumber(n: 10)
//findOne(nums: nums)

//: [Next](@next)
