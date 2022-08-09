//
//  Leetcode141.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/5.
//

import Foundation

// [141] 环形链表
class Solution141 {
    func hasCycle(_ head: ListNode?) -> Bool {
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
