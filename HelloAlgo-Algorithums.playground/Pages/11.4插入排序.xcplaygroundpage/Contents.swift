//: [Previous](@previous)

import Foundation

/// 插入排序
func insetionSort(nums: inout [Int]) {
    // 外循环：已排序元素数量为 1, 2, ..., n
    for i in stride(from: 1, to: nums.count, by: 1) {
        var base = nums[i]
        var j = i - 1
        // 内循环：将 base 插入到一排序部分的正确位置
        while j >= 0, nums[j] > base {
            nums[j + 1] = nums[j] // 将 nums[j] 向右移动一位
            j -= 1
        }
        nums[j + 1] = base // 将 base 赋值到正确位置
    }
}

func test() {
    var nums = [4, 1, 3, 1, 5, 2]
    insetionSort(nums: &nums)
    print(nums)
}

test()

//: [Next](@next)
