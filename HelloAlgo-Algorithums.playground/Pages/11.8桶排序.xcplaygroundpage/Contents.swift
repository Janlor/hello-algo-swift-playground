//: [Previous](@previous)

import Foundation

/// 桶排序
func bucketSort(nums: inout [Double]) {
    // 初始化 k = n / 2 个桶，预期向每个桶分配 2 个元素
    let k = nums.count / 2
    var buckets = (0 ..< k).map { _ in [Double]() }
    // 1. 将数组元素分配到各个桶中
    for num in nums {
        // 输入数据范围为 [0, 1)，使用 num * k 映射到索引范围 [0, k - 1]
        let i = Int(num * Double(k))
        // 将 num 添加进桶 i
        buckets[i].append(num)
    }
    // 2. 对各个桶执行排序
    for i in buckets.indices {
        buckets[i].sort()
    }
    // 3. 遍历桶合并结果
    var i = nums.startIndex
    for bucket in buckets {
        for num in bucket {
            nums[i] = num
            i += 1
        }
    }
}

func test() {
    // 设输入数据为浮点数，范围为 [0, 1)
    var nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
    bucketSort(nums: &nums)
    print(nums)
}

test()

//: [Next](@next)
