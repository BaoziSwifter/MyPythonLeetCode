//
//  Leetcode141.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/5.
//

import Foundation

// [141] 环形链表

public class ListNode141 {
    public var val: Int
    public var next: ListNode141?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    public init(_ val: Int, _ next: ListNode141?) {
        self.val = val;
        self.next = next;
    }
}

class Solution141 {
    func hasCycle(_ head: ListNode141?) -> Bool {
        var slow = head
        var fast = head
        while slow?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                return true
            }
        }
        return false
    }
}
