//
//  138.随机链表的复制.swift
//  LeetCode
//
//  Created by Janlor on 4/21/24.
//

import Foundation
/*
 
 给你一个长度为 n 的链表，每个节点包含一个额外增加的随机指针 random ，该指针可以指向链表中的任何节点或空节点。

 构造这个链表的 深拷贝。 深拷贝应该正好由 n 个 全新 节点组成，其中每个新节点的值都设为其对应的原节点的值。新节点的 next 指针和 random 指针也都应指向复制链表中的新节点，并使原链表和复制链表中的这些指针能够表示相同的链表状态。复制链表中的指针都不应指向原链表中的节点 。

 例如，如果原链表中有 X 和 Y 两个节点，其中 X.random --> Y 。那么在复制链表中对应的两个节点 x 和 y ，同样有 x.random --> y 。

 返回复制链表的头节点。

 用一个由 n 个节点组成的链表来表示输入/输出中的链表。每个节点用一个 [val, random_index] 表示：

 val：一个表示 Node.val 的整数。
 random_index：随机指针指向的节点索引（范围从 0 到 n-1）；如果不指向任何节点，则为  null 。
 你的代码 只 接受原链表的头节点 head 作为传入参数。

  

 示例 1：



 输入：head = [[7,null],[13,0],[11,4],[10,2],[1,0]]
 输出：[[7,null],[13,0],[11,4],[10,2],[1,0]]
 示例 2：



 输入：head = [[1,1],[2,1]]
 输出：[[1,1],[2,1]]
 示例 3：



 输入：head = [[3,null],[3,0],[3,null]]
 输出：[[3,null],[3,0],[3,null]]
  

 提示：

 0 <= n <= 1000
 -104 <= Node.val <= 104
 Node.random 为 null 或指向链表中的节点。
 
 */

public class Node {
    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

class CopyRandomList {
    func copyRandomList(_ head: Node?) -> Node? {
        guard head != nil else {
            return nil
        }
        var cur = head
        // 1. 复制各节点，并构建拼接链表
        while cur != nil {
            let tmp = Node(cur!.val)
            tmp.next = cur?.next
            cur?.next = tmp
            cur = tmp.next
        }
        // 2. 构建各新节点的 random 指向
        cur = head
        while cur != nil {
            if cur?.random != nil {
                cur?.next?.random = cur?.random?.next
            }
            cur = cur?.next?.next
        }
        // 3. 拆分两链表
        cur = head?.next
        var pre = head
        var res = head?.next
        while cur?.next != nil {
            pre?.next = pre?.next?.next
            cur?.next = cur?.next?.next
            pre = pre?.next
            cur = cur?.next
        }
        pre?.next = nil // 单独处理原链表尾节点
        return res
    }
    
    func test() {
        // [[7,null],[13,0],[11,4],[10,2],[1,0]]
        let node0 = Node(7)
        let node1 = Node(13)
        let node2 = Node(11)
        let node3 = Node(10)
        let node4 = Node(1)
        
        node0.next = node1
        node1.next = node2
        node2.next = node3
        node3.next = node4
        
        node0.random = nil
        node1.random = node0
        node2.random = node4
        node3.random = node2
        node4.random = node0
        
        let _ = copyRandomList(node0)
        
    }
}
