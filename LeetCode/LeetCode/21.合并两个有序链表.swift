//
//  21.合并两个有序链表.swift
//  LeetCode
//
//  Created by Janlor on 1/3/24.
//

/* 
 
将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

示例 1：

输入：l1 = [1,2,4], l2 = [1,3,4]
输出：[1,1,2,3,4,4]

示例 2：

输入：l1 = [], l2 = []
输出：[]

示例 3：

输入：l1 = [], l2 = [0]
输出：[0]
 

提示：

两个链表的节点数目范围是 [0, 50]
-100 <= Node.val <= 100
l1 和 l2 均按 非递减顺序 排列
 
*/

class MergeTwoLists {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var p: ListNode? = ListNode(-1)
        let h: ListNode? = p
        
        var l1 = list1
        var l2 = list2
        
        while l1 != nil, l2 != nil {
            if l1!.val <= l2!.val {
                p?.next = l1
                l1 = l1?.next
            } else {
                p?.next = l2
                l2 = l2?.next
            }
            p = p?.next
        }
        
        p?.next = l1 ?? l2
        
        return h?.next
    }
    
    func test1() {
        let list1 = ListNode(1)
        list1.next = ListNode(2)
        list1.next?.next = ListNode(4)

        let list2 = ListNode(1)
        list2.next = ListNode(3)
        list2.next?.next = ListNode(4)

        let list = mergeTwoLists(list1, list2)
        list?.print()
    }
    
    func test2() {
        let list1: ListNode? = nil
        let list2: ListNode? = nil

        let list = mergeTwoLists(list1, list2)
        list?.print()
    }
    
    func test3() {
        let list1: ListNode? = nil
        let list2: ListNode? = ListNode(0)
        
        let list = mergeTwoLists(list1, list2)
        list?.print()
    }
}
