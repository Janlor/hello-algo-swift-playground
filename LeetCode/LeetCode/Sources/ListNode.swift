//
//  ListNode.swift
//  LeetCode
//
//  Created by Janlor on 1/3/24.
//

import Foundation

// Definition for singly-linked list.
public class ListNode: Hashable {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        lhs.val == rhs.val && lhs.next.map { ObjectIdentifier($0) } == rhs.next.map { ObjectIdentifier($0) }
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
        hasher.combine(next.map { ObjectIdentifier($0) })
    }
    
    public static func arrToLinkedList(arr: [Int]) -> ListNode? {
        let dum = ListNode(0)
        var head: ListNode? = dum
        for val in arr {
            head?.next = ListNode(val)
            head = head?.next
        }
        return dum.next
    }
    
    public func print() {
        var head: ListNode? = self
        var vals: [String] = []
        while head != nil {
            vals.append("\(head!.val)")
            head = head?.next
        }
        let result = vals.joined(separator: "-")
        debugPrint(result)
    }
}
