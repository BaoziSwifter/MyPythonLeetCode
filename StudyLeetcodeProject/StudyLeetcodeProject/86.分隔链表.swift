//
//  Leetcode86.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/5.
//

import Foundation

// [86] 分隔链表

class Solution86 {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var head = head
        let dumyLeft = ListNode(-1)
        let dumyRight = ListNode(-1)
        var dl: ListNode? = dumyLeft, dr: ListNode? = dumyRight
        while head != nil {
            if head!.val < x {
                dl!.next = head
                dl = dl!.next
            } else {
                dr!.next = head
                dr = dr!.next
            }
            let tmp = head?.next
            head?.next = nil
            head = tmp
        }
        dl?.next = dumyRight.next
        return dumyLeft.next
    }
}
