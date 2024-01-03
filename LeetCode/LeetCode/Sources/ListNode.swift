//
//  ListNode.swift
//  LeetCode
//
//  Created by Janlor on 1/3/24.
//

import Foundation

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
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
