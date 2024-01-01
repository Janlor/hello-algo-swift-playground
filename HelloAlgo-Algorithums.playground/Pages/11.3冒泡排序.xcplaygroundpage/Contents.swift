//: [Previous](@previous)

import Foundation

/// 冒泡排序
func bubbleSort(nums: inout [Int]) {
    // 外循环：未排序区间为 [0, i]
    for i in stride(from: nums.count - 1, to: 0, by: -1) {
//        print("i:\(i)")
        // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
        for j in stride(from: 0, to: i, by: 1) {
            print("j:\(j)")
            if nums[j] > nums[j + 1] {
                // 交换 nums[j] 与 nums[j + 1]
                let tmp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
            }
        }
    }
}

func test() {
    var nums = [4, 1, 3, 1, 5, 2]
    bubbleSort(nums: &nums)
    print(nums)
}

test()

//: [Next](@next)
