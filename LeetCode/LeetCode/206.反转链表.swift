//
//  206.反转链表.swift
//  LeetCode
//
//  Created by Janlor on 1/3/24.
//

/* 给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。

示例 1：

输入：head = [1,2,3,4,5]
输出：[5,4,3,2,1]
 
示例 2：

输入：head = [1,2]
输出：[2,1]
 
示例 3：

输入：head = []
输出：[]

提示：

链表中节点的数目范围是 [0, 5000]
-5000 <= Node.val <= 5000
 

进阶：链表可以选用迭代或递归方式完成反转。你能否用两种方法解决这道题？
 */

import Foundation

class ReverseList {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var cur = head
        while cur != nil {
            let next = cur?.next
            cur?.next = prev
            prev = cur
            cur = next
        }
        return prev
    }
    
    func reverseList2(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let newHead = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return newHead
    }
    
    func test1() {
        let list = ListNode(1)
        list.next = ListNode(2)
        list.next?.next = ListNode(3)
        list.next?.next?.next = ListNode(4)
        list.next?.next?.next?.next = ListNode(5)
        list.print()

        let head = reverseList(list)
        head?.print()
    }
}
