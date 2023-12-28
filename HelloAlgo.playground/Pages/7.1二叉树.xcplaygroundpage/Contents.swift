//: [Previous](@previous)

import Foundation

/* 1. 初始化二叉树 */

// 初始化节点
let n1 = TreeNode(x: 1)
let n2 = TreeNode(x: 2)
let n3 = TreeNode(x: 3)
let n4 = TreeNode(x: 4)
let n5 = TreeNode(x: 5)

// 构建节点之间的引用（指针）
n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5

/* 2. 插入与删除节点 */

// 在 n1 -> n2 中间插入节点 P
let P = TreeNode(x: 0)
n1.left = P
P.left = n2
// 删除节点
n1.left = n2

//: [Next](@next)
