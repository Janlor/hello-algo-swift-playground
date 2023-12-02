//: [Previous](@previous)

import Foundation

let nums: [Any] = [1, "2", [123]]
debugPrint(nums)

let arr = Array(repeating: 0, count: 10)
var arr1: [Int] = [1, 2, 3, 4, 5]

func randomAccess(nums: [Int]) -> Int {
    let randomIndex = nums.indices.randomElement()!
    let randomNum = nums[randomIndex]
    return randomNum
}
randomAccess(nums: arr1)

/// 插入元素

arr1.insert(8, at: 2)
print(arr1)

/// 在数组的索引 index 处插入元素 num
func insert(nums: inout [Int], num: Int, at index: Int) {
    // 把索引 index以及之后的所有元素向后移动一位
    for i in nums.indices.dropFirst(index).reversed() {
        nums[i] = nums[i - 1]
    }
    // 将 num 赋值给 index 处的元素
    nums[index] = num
}
insert(nums: &arr1, num: 9, at: 2)
print(arr1)

/// 删除元素
arr1.remove(at: 2)
print(arr1)

func remove(nums: inout [Int], index: Int) {
    for i in nums.indices.dropFirst(index).dropLast() {
        nums[i] = nums[i + 1]
    }
}
remove(nums: &arr1, index: 0)
print(arr1)

/// 遍历数组

func traverse(nums: [Int]) {
    var count = 0
    // 通过索引遍历数组
    for i in nums.indices {
        count += nums[i]
    }
    // 直接遍历数组元素
    for num in nums {
        count += num
    }
    for (i, num) in nums.enumerated() {
        print("\(i),\(num).")
    }
}
traverse(nums: arr1)

/// 查找元素

func find(nums: [Int], target: Int) -> Int {
    for i in nums.indices {
        if nums[i] == target {
            return i
        }
    }
    return -1
}
find(nums: arr1, target: 4)

/// 扩容数组

// 扩展数组长度
func extend(nums: [Int], enlarge: Int) -> [Int] {
    // 初始化一个扩展长度后的数组
    var res = Array(repeating: 0, count: nums.count + enlarge)
    // 将原数组中的所有元素复制到新数组
    for i in nums.indices {
        res[i] = nums[i]
    }
    // 返回扩展后的新数组
    return res
}

//: [Next](@next)
