//
//  86.分隔链表.swift
//  LeetCode
//
//  Created by Janlor on 4/21/24.
//

import Foundation

/*
 给你一个链表的头节点 head 和一个特定值 x ，请你对链表进行分隔，使得所有 小于 x 的节点都出现在 大于或等于 x 的节点之前。
 你应当 保留 两个分区中每个节点的初始相对位置。

 示例 1：
 输入：head = [1,4,3,2,5,2], x = 3
 输出：[1,2,2,4,3,5]
 
 示例 2：
 输入：head = [2,1], x = 2
 输出：[1,2]
  
 提示：
 链表中节点的数目在范围 [0, 200] 内
 -100 <= Node.val <= 100
 -200 <= x <= 200
 */

class SeperatorNode {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var newHead = head
        
        var small = ListNode(0)
        let smallHead = small
        var large = ListNode(0)
        let largeHead = large
        
        while newHead != nil {
            if let val = newHead?.val, val < x {
                small.next = newHead
                small = small.next!
            } else {
                large.next = newHead
                large = large.next!
            }
            newHead = newHead?.next
        }
        
        large.next = nil
        small.next = largeHead.next
        
        return smallHead.next
    }
    
    func partition2(_ head: ListNode?, _ x: Int) -> ListNode? {
        // 创建两个虚拟节点作为两个分区的头节点
        let dummySmaller = ListNode(0)
        let dummyGreaterEqual = ListNode(0)
        
        // 创建两个指针分别指向两个分区的当前节点
        var smallerPointer = dummySmaller
        var greaterEqualPointer = dummyGreaterEqual
        
        var current = head
        
        // 遍历链表
        while current != nil {
            if current!.val < x {
                // 小于 x 的节点接入小于 x 的分区
                smallerPointer.next = current
                smallerPointer = smallerPointer.next!
            } else {
                // 大于等于 x 的节点接入大于等于 x 的分区
                greaterEqualPointer.next = current
                greaterEqualPointer = greaterEqualPointer.next!
            }
            
            // 移动到下一个节点
            current = current!.next
        }
        
        // 将两个分区连接起来
        greaterEqualPointer.next = nil // 确保大于等于 x 的分区的尾节点为 nil，避免循环
        smallerPointer.next = dummyGreaterEqual.next
        
        // 返回新的头节点
        return dummySmaller.next
    }
    
    func test() {
        let head = ListNode.arrToLinkedList(arr: [1, 4, 3, 2, 5, 2])
        head?.print()
        let result = partition2(head, 3)
        result?.print()
    }
}
