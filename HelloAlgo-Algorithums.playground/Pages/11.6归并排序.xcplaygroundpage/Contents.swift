//: [Previous](@previous)

import Foundation

/// 合并左子数组和右子数组
func merge(nums: inout [Int], left: Int, mid: Int, right: Int) {
    // 左子数组区间 [left, mid]， 右子数组区间 [mid + 1, right]
    // 创建一个临时数组 tmp，用于存放合并后的结果
    var tmp = Array(repeating: 0, count: right - left + 1)
    // 初始化左子数组和右子数组的起始索引
    var i = left, j = mid + 1, k = 0
    // 当左右子数组都还有元素时，进行比较并将较小的元素复制到临时数组中
    while i <= mid, j <= right {
        if nums[i] <= nums[j] {
            tmp[k] = nums[i]
            i += 1
        } else {
            tmp[k] = nums[j]
            j += 1
        }
        k += 1
    }
    // 将左子数组和右子数组的剩余元素复制到临时数组中
    while i <= mid {
        tmp[k] = nums[i]
        i += 1
        k += 1
    }
    while j <= right {
        tmp[k] = nums[j]
        j += 1
        k += 1
    }
    // 将临时数组 tmp 中的元素复制回原数组 nums 的对应区间
    for k in tmp.indices {
        nums[left + k] = tmp[k]
    }
}

/// 归并排序
func mergeSort(nums: inout [Int], left: Int, right: Int) {
    // 终止条件
    if left >= right {
        return
    }
    // 划分阶段
    let mid = (left + right) / 2 // 计算中点
    mergeSort(nums: &nums, left: left, right: mid) // 递归左子数组
    mergeSort(nums: &nums, left: mid + 1, right: right) // 递归右子数组
    // 合并阶段
    merge(nums: &nums, left: left, mid: mid, right: right)
}

//: [Next](@next)
