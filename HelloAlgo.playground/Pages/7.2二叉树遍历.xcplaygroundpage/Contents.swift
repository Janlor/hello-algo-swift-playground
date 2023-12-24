//: [Previous](@previous)

import Foundation

/// 二叉树节点类
class TreeNode {
    var val: Int // 节点值
    var left: TreeNode? // 左子节点引用
    var right: TreeNode? // 右子节点引用
    
    init(x: Int) {
        self.val = x
    }
}

/* 广度优先遍历 */

/// 层序遍历（）
func levelOrder(root: TreeNode) -> [Int] {
    // 初始化队列，加入跟节点
    var queue: [TreeNode] = [root]
    // 初始化一个列表，用于保存遍历的序列
    var list: [Int] = []
    while !queue.isEmpty {
        let node = queue.removeFirst() // 队列出队
        list.append(node.val) // 保存节点值
        if let left = node.left {
            queue.append(node.left) // 左子节点入队
        }
        if let right = node.right {
            queue.append(node.right) // 右子节点入队
        }
    }
    return list
}

/* 深度优先遍历 */

// 初始化一个列表，用于保存遍历的序列
var list: [Int] = []

/// 前序遍历
func preOrder(root: TreeNode?) {
    guard let root = root else { return }
    // 访问优先级：跟节点 -> 左子树 -> 右子树
    list.append(root.val)
    preOrder(root: root.left)
    preOrder(root: root.right)
}

/// 中序遍历
func inOrder(root: TreeNode?) {
    guard let root = root else { return }
    // 访问优先级：左子树 -> 跟节点 -> 右子树
    inOrder(root: root.left)
    list.append(root.val)
    inOrder(root: root.right)
}

/// 后序遍历
func postOrder(root: TreeNode?) {
    guard let root = root else { return }
    // 访问优先级：左子树 -> 右子树 -> 跟节点
    postOrder(root: root.left)
    postOrder(root: root.right)
    list.append(root.val)
}

//: [Next](@next)
