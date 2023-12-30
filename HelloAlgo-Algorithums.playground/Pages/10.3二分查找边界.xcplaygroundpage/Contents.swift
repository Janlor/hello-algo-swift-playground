//: [Previous](@previous)

import Foundation

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

/// 二分查找最左一个 target
func binarySearchLeftEdge(nums: [Int], target: Int) -> Int {
    // 等价于查找 target 的插入点
    let i = binarySearchInsertion(nums: nums, target: target)
    // 未找到 target，返回 -1
    if i == nums.count || nums[i] != target {
        return -1
    }
    // 找到 target，返回索引 i
    return i
}

/// 二分查找最右一个 target
func binarySearchRightEdge(nums: [Int], target: Int) -> Int {
    // 转化为查找最左一个 target + 1
    let i = binarySearchInsertion(nums: nums, target: target + 1)
    // j 指向最有一个 target，i 指向首个大于 target 的元素
    let j = i - 1
    // 未找到 target，返回 -1
    if j == -1 || nums[j] != target {
        return -1
    }
    // 找到 target，返回索引 j
    return j
}

func test() {
    let target = 6
    // 包含重复元素的数组
    var nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
    print("\n数组 nums = \(nums)")
    
    // 二分查找插入点
    let leftIndex = binarySearchLeftEdge(nums: nums, target: target)
    print("元素 \(target) 的最左插入点的索引为 \(leftIndex)")
    
    let rightIndex = binarySearchRightEdge(nums: nums, target: target)
    print("元素 \(target) 的最右插入点的索引为 \(rightIndex)")
}

test()

//: [Next](@next)
