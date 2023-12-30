//: [Previous](@previous)

import Foundation

/*
 给定一个整数数组 nums 和一个目标元素 target ，请在数组中搜索“和”为 target 的两个元素，并返回它们的数组索引。返回任意一个解即可。
 */

/// 方法一：暴力枚举
func twoSumBruteForce(nums: [Int], target: Int) -> [Int] {
    // 两层循环，时间复杂度为 O(n^2)
    for i in nums.indices.dropLast() {
        for j in nums.indices.dropFirst(i + 1) {
            if nums[i] + nums[j] == target {
                return [i, j]
            }
        }
    }
    return [0]
}

/// 方法二：辅助哈希表
func twoSumHashTable(nums: [Int], target: Int) -> [Int] {
    // 辅助哈希表，空间复杂度为 O(n)
    var dict: [Int: Int] = [:]
    // 单层循环，时间复杂度为 O(n)
    for i in nums.indices {
        if let j = dict[target - nums[i]] {
            return [j, i]
        }
        dict[nums[i]] = i
    }
    return [0]
}

func test() {
    // ======= Test Case =======
    let nums = [2, 7, 11, 15]
    let target = 13
    // ====== Driver Code ======
    // 方法一
    var res = twoSumBruteForce(nums: nums, target: target)
    print("方法一 res = \(res)")
    // 方法二
    res = twoSumHashTable(nums: nums, target: target)
    print("方法二 res = \(res)")
}

test()

//: [Next](@next)
