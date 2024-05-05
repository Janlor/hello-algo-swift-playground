//: [Previous](@previous)

import Foundation

/// 堆的长度为 n， 从节点 i 开始，从顶至底堆化
func siftDown(nums: inout [Int], n: Int, i: Int) {
    var i = i
    while true {
        // 判断节点 i， left, right 中值最大的节点，记为 max
        let left = 2 * i + 1
        let right = 2 * i + 2
        var max = i
        if left < n, nums[left] > nums[max] {
            max = left
        }
        if right < n, nums[right] > nums[max] {
            max = right
        }
        // 若节点 i 最大或索引 left，right 越界，则无须继续堆化，跳出
        if max == i {
            break
        }
        // 交换两节点
        nums.swapAt(i, max)
        // 循环向下堆化
        i = max
    }
}

/// 堆排序
func heapSort(nums: inout [Int]) {
    // 建堆操作：堆化除叶节点以外的其他所有节点
    let n = nums.count
    for i in stride(from: n / 2 - 1, through: 0, by: -1) {
        siftDown(nums: &nums, n: n, i: i)
    }
    // 从堆中提取最大元素，循环 n-1 轮
    for i in nums.indices.dropFirst().reversed() {
        // 交换根节点与最右叶节点（交换首元素与尾元素）
        nums.swapAt(0, i)
        // 以根节点为起点，从顶至底进行堆化
        siftDown(nums: &nums, n: i, i: 0)
    }
}

func test() {
    var nums = [4, 1, 3, 1, 5, 2]
    heapSort(nums: &nums)
    print(nums)
}

test()

//: [Next](@next)
