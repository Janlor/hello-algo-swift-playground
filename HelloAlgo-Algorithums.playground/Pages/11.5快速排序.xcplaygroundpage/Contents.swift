//: [Previous](@previous)

import Foundation

/// 元素交换
func swap(nums: inout [Int], i: Int, j: Int) {
    let tmp = nums[i]
    nums[i] = nums[j]
    nums[j] = tmp
}

/// 哨兵划分
func partition(nums: inout [Int], left: Int, right: Int) -> Int {
    // 以 nums[left] 为基准数
    var i = left
    var j = right
    while i < j {
        while i < j, nums[j] >= nums[left] {
            j -= 1 // 从右向左找首页小于基准数的元素
        }
        while i < j, nums[i] <= nums[left] {
            i += 1 // 从左向右找首个大于基准数的元素
        }
        swap(nums: &nums, i: i, j: j) // 交换这两个元素
    }
    swap(nums: &nums, i: i, j: left) // 将基准数交换至两子数组的分界线
    return i // 返回基准数的索引
}

/// 快速排序
func quickSort(nums: inout [Int], left: Int, right: Int) {
    // 子数组长度为 1 时终止递归
    if left >= right {
        return
    }
    // 哨兵划分
    let pivot = partition(nums: &nums, left: left, right: right)
    // 递归左子数组、右子数组
    quickSort(nums: &nums, left: left, right: pivot - 1)
    quickSort(nums: &nums, left: pivot + 1, right: right)
}

/// 选取三个候选元素的中位数
func medianThree(nums: [Int], left: Int, mid: Int, right: Int) -> Int {
    let l = nums[left]
    let m = nums[mid]
    let r = nums[right]
    if (m >= l && m <= r) || (m >= r && m <= l) {
        return mid
    } else if (l >= m && l <= r) || (l >= r && l <= m) {
        return left
    }
    return right
}

/// 哨兵划分（三数取中值）
func partitionMedian(nums: inout [Int], left: Int, right: Int) -> Int {
    // 选取三个候选元素的中位数
    let med = medianThree(nums: nums, left: left, mid: (left + right) / 2, right: right)
    // 将中位数交换至数组最左端
    swap(nums: &nums, i: left, j: med)
    return partition(nums: &nums, left: left, right: right)
}

/// 快速排序（尾递归优化）
func quickSorttailCall(nums: inout [Int], left: Int, right: Int) {
    var left = left
    var right = right
    // 子数组长度为 1 时终止
    while left < right {
        // 哨兵划分操作
        let pivot = partition(nums: &nums, left: left, right: right)
        if (pivot - left) < (right - pivot) {
            quickSorttailCall(nums: &nums, left: left, right: pivot - 1)
            left = pivot + 1
        } else {
            quickSorttailCall(nums: &nums, left: pivot + 1, right: right)
            right = pivot - 1
        }
    }
}

//: [Next](@next)
