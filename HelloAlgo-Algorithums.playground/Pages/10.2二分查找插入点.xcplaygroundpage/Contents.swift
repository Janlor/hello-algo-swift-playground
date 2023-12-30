//: [Previous](@previous)

import Foundation

/// 二分查找插入点（无重复元素）
func binarySearchInsertionSimple(nums: [Int], target: Int) -> Int {
    // 初始化双闭区间 [0, n-1]
    var i = 0, j = nums.count - 1
    while i <= j {
        // 计算中点索引 m
        let m = i + (j - i) / 2
        if nums[m] < target {
            // [m+1, j]
            i = m + 1
        } else if nums[m] > target {
            // [i, m-1]
            j = m - 1
        } else {
            return m
        }
    }
    // 未找到，返回插入点
    return i
}

/// 二分查找插入点（存在重复元素）
func binarySearchInsertion(nums: [Int], target: Int) -> Int {
    // 初始化双闭区间 [0, n-1]
    var i = 0, j = nums.count - 1
    while i <= j {
        // 计算中点索引 m
        let m = i + (j - i) / 2
        if nums[m] < target {
            // [m+1, j]
            i = m + 1
        } else if nums[m] > target {
            // [i, m-1]
            j = m - 1
        } else {
            j = m - 1
        }
    }
    // 未找到，返回插入点
    return i
}

func test() {
    // 无重复元素的数组
    var nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
    print("\n数组 nums = \(nums)")
    // 二分查找插入点
    for target in [6, 9] {
        let index = binarySearchInsertionSimple(nums: nums, target: target)
        print("元素 \(target) 的插入点的索引为 \(index)")
    }

    // 包含重复元素的数组
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
    print("\n数组 nums = \(nums)")
    // 二分查找插入点
    for target in [2, 6, 20] {
        let index = binarySearchInsertion(nums: nums, target: target)
        print("元素 \(target) 的插入点的索引为 \(index)")
    }
}

test()

//: [Next](@next)
