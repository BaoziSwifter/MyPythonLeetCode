//
//  Leetcode83.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/8.
//

import Foundation

/**
 [83] 删除排序链表中的重复元素
 给定一个已排序的链表的头 head ， 删除所有重复的元素，使每个元素只出现一次 。返回 已排序的链表。
 */

class Solution83 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var slow: ListNode? = head, fast: ListNode? = head
        while fast != nil {
            if fast?.val != slow?.val {
                slow?.next = fast
                slow = slow?.next
            }
            fast = fast?.next
        }
        slow?.next = nil
        return head
    }
}
