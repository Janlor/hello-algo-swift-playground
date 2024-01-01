//: [Previous](@previous)

import Foundation

/// 选择排序
func selectionSort(nums: inout [Int]) {
    // 外循环：未排序区间 [i, n - 1]
    for i in nums.indices.dropLast() {
//        print("i:\(i)")
        // 内循环：找到未排序区间内的最小元素
        var k = i
        for j in nums.indices.dropFirst(i + 1) {
//            print("j:\(j)")
            if nums[j] < nums[k] {
                k = j // 记录最小元素的索引
            }
        }
//        print("k:\(k)")
        // 将该最小元素与未排序区间的首个元素交换
        nums.swapAt(i, k)
    }
}

func test() {
    var nums = [4, 1, 3, 1, 5, 2]
    selectionSort(nums: &nums)
    print(nums)
}

test()

//: [Next](@next)
