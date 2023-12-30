//: [Previous](@previous)

import Foundation

/// 二叉搜索树
class BinarySearchTree {
    private var root: TreeNode?
    
    init() {
        root = nil
    }
    
    /// 获取二叉树根节点
    func getRoot() -> TreeNode? {
        root
    }
    
    /// 查找节点
    func search(num: Int) -> TreeNode? {
        var cur: TreeNode? = root
        // 循环查找，越过叶节点后跳出
        while cur != nil {
            // 目标节点在 cur 的右子树中
            if cur!.val < num {
                cur = cur?.right
            }
            // 目标节点在 cur 的左子树中
            else if cur!.val > num {
                cur = cur?.left
            }
            // 找到目标节点，跳出循环
            else {
                break
            }
        }
        // 返回目标节点
        return cur
    }
    
    /// 插入节点
    func insert(num: Int) {
        // 若树为空，则初始化根节点
        if root == nil {
            root = TreeNode(x: num)
            return
        }
        var cur: TreeNode? = root
        var pre: TreeNode?
        // 循环查找，越过叶节点后跳出
        while cur != nil {
            // 找到重复节点 直接返回
            if cur!.val == num {
                return
            }
            pre = cur
            // 插入位置在 cur 的右子树中
            if cur!.val < num {
                cur = cur?.right
            }
            // 插入位置在 cur 的左子树中
            else {
                cur = cur?.left
            }
        }
        // 插入节点
        let node = TreeNode(x: num)
        if pre!.val < num {
            pre?.right = node
        } else {
            pre?.left = node
        }
    }
    
    /// 删除节点
    func remove(num: Int) {
        // 若树为空 则提前返回
        guard root != nil else {
            return
        }
        var cur = root
        var pre: TreeNode?
        while cur != nil {
            // 找到待删除节点，则跳出循环
            if cur!.val == num {
                break
            }
            pre = cur
            if cur!.val < num {
                cur = cur?.right
            } else {
                cur = cur?.left
            }
        }
        // 没找到待删除节点，则直接返回
        guard cur != nil else {
            return
        }
        // 子节点数量为 0 或 1
        if cur?.left == nil || cur?.right == nil {
            // 当子节点数量为 0 或 1 时，child 为 null 或该子节点
            let child = cur?.left ?? cur?.right ?? nil
            // 删除节点 cur
            if child !== root {
                if pre?.left === cur {
                    pre?.left = child
                } else {
                    pre?.right = child
                }
            } else {
                // 若删除节点为根节点，则重新指定根节点
                root = child
            }
        }
        // 子节点数量为 2
        else {
            // 获取中序遍历中 cur 的下一个节点
            var tmp = cur?.right
            while tmp?.left != nil {
                tmp = tmp?.left
            }
            // 递归删除节点 tmp
            remove(num: tmp!.val)
            // 用 tmp 覆盖 cur
            cur?.val = tmp!.val
        }
    }
}

/*
          8
     4         12
  2    6    10    14
 1 3  5 7  9 11  13 15
 
 */
//var root = TreeNode(x: 8)
//root.left = TreeNode(x: 4)
//root.right = TreeNode(x: 12)
//root.left?.left = TreeNode(x: 2)
//root.left?.right = TreeNode(x: 6)
//root.right?.left = TreeNode(x: 10)
//root.right?.right = TreeNode(x: 14)
//root.left?.left?.left = TreeNode(x: 1)
//root.left?.left?.right = TreeNode(x: 3)
//root.left?.right?.left = TreeNode(x: 5)
//root.left?.right?.right = TreeNode(x: 7)
//root.right?.left?.left = TreeNode(x: 9)
//root.right?.left?.right = TreeNode(x: 11)
//root.right?.right?.left = TreeNode(x: 13)
//root.right?.right?.right = TreeNode(x: 15)

func test() {
    
    let tree = BinarySearchTree()
    let nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
    for num in nums {
        tree.insert(num: num)
    }
    print(tree)
    
    // 查找节点
    tree.search(num: 7)
    
    // 插入节点
    //tree.insert(num: 16)
    
    // 删除节点
    //tree.remove(num: 1)
    //tree.remove(num: 2)
    //tree.remove(num: 4)
}

test()

//: [Next](@next)

