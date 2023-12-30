//: [Previous](@previous)

import Foundation

// 二叉树的数组表示
// 使用 Int?可空类型，就可以使用 nil 来标记空位
let tree: [Int?] = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]

/// 数组表示下的二叉树类
class ArrayBinaryTree {
    private var tree: [Int?]
    
    /// 构造方法
    init(tree: [Int?]) {
        self.tree = tree
    }
    
    /// 节点数量
    func size() -> Int {
        tree.count
    }
    
    /// 获取索引为 i 节点的值
    func val(i: Int) -> Int? {
        // 若索引越界，则返回 null，代表空位
        guard i > 0, i < size() else {
            return nil
        }
        return tree[i]
    }
    
    /// 获取索引为 i 节点的左子节点的索引
    func left(i: Int) -> Int {
        2 * i + 1
    }
    
    /// 获取索引为 i 节点的右子节点的索引
    func right(i: Int) -> Int {
        2 * i + 2
    }
    
    /// 获取索引为 i 节点的父节点的索引
    func parent(i: Int) -> Int {
        (i - 1) / 2
    }
    
    /// 层序遍历
    func levelOrder() -> [Int] {
        var res: [Int] = []
        // 直接遍历数组
        for i in stride(from: 0, to: size(), by: 1) {
            if let val = val(i: i) {
                res.append(val)
            }
        }
        return res
    }
    
    /// 深度优先遍历
    private func dfs(i: Int, order: String, res: inout [Int]) {
        // 若为空，则返回
        guard let val = val(i: i) else { return }
        // 前序遍历
        if order == "pre" {
            res.append(val)
        }
        dfs(i: left(i: i), order: order, res: &res)
        // 中序遍历
        if order == "in" {
            res.append(val)
        }
        dfs(i: right(i: i), order: order, res: &res)
        // 后序遍历
        if order == "post" {
            res.append(val)
        }
    }
    
    /// 前序遍历
    func preOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "pre", res: &res)
        return res
    }
    
    /// 中序遍历
    func inOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "in", res: &res)
        return res
    }
    
    /// 后序遍历
    func postOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "post", res: &res)
        return res
    }
}

//: [Next](@next)
