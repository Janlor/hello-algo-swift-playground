//: [Previous](@previous)

import Foundation

/// 类
class Node {
    var val: Int
    var next: Node?
    
    init(val: Int, next: Node? = nil) {
        self.val = val
        self.next = next
    }
}

/// 函数
@discardableResult
func function() -> Int {
    return 0
}

func algorithm(n: Int) -> Int {
    let a = 0 // 暂存数据（常量）
    var b = 0 // 暂存数据（变量）
    let node = Node(val: 0) // 暂存数据（对象）
    let c = function() // 栈帧空间（调用函数）
    return a + b + c // 输出数据
}

//algorithm(n: 10)

/* ---------------- */

func algorithm1(n: Int) {
    let a = 0
    let b = Array(repeating: 0, count: 10000)
    if n > 10 {
        let nums = Array(repeating: 0, count: n)
    }
}

/* ---------------- */

/// 循环 O(1)
func loop(n: Int) {
    for _ in 0 ..< n {
        function()
    }
}

/// 递归 O(n)
func recur(n: Int) {
    if n == 1 {
        return
    }
    recur(n: n - 1)
}

/* ---------------- */

/// 常数阶 O(1)
func constant(n: Int) {
    // 常量、变量、对象占用 O(1) 空间
    let a = 0
    let b = 0
    let nums = Array(repeating: 0, count: 10000)
    let node = Node(val: 0)
    // 循环中的变量占用 O(1) 空间
    for _ in 0 ..< n {
        let c = 0
    }
    // 循环中的函数占用 O(1) 空间
    for _ in 0 ..< n {
        function()
    }
}

/* ---------------- */

/// 线性阶 O(n)
func linear(n: Int) {
    // 长度为 n 的数组占用 O(n) 空间
    let nums = Array(repeating: 0, count: n)
    // 长度为 n 的列表占用 O(n) 空间
    let nodes = (0 ..< n).map { Node(val: $0) }
    // 长度为 n 的哈希表占用 O(n) 空间
    let map = Dictionary(uniqueKeysWithValues: (0 ..< n).map { ($0, "\($0)") })
}
//linear(n: 10)

/// 线性阶（递归实现）
func linearRecur(n: Int) {
    print("递归 n = \(n)")
    if n == 1 {
        return
    }
    linearRecur(n: n - 1)
}

/* ---------------- */

/// 平方阶
func quadratic(n: Int) {
    // 二维列表占用 O(n^2) 空间
    let numList = Array(repeating: Array(repeating: 0, count: n), count: n)
}

/// 平方阶（递归实现）
func quadraticRecur(n: Int) -> Int {
    if n <= 0 {
        return 0
    }
    // 数组 nums 长度为 n, n-1, n-2 ..., 2, 1
    let nums = Array(repeating: 0, count: n)
    print("递归 n = \(n) 中的 nums 长度 = \(nums.count)")
    return quadraticRecur(n: n - 1)
}
//quadraticRecur(n: 10)

/* ---------------- */

class TreeNode {
    var x: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(x: Int) {
        self.x = x
    }
}

/// 指数阶（建立满二叉树）
func buildTree(n: Int) -> TreeNode? {
    if n == 0 {
        return nil
    }
    let root = TreeNode(x: n - 1)
    root.left = buildTree(n: n - 1)
    root.right = buildTree(n: n - 1)
    return root
}
//buildTree(n: 3)

/* ---------------- */

//: [Next](@next)
