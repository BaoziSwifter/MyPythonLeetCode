//
//  206.反转链表.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution206 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let l = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return l
    }
    func reverseList1(_ head: ListNode?) -> ListNode? {
        var head = head
        var cur:ListNode?
        while head != nil {
            let tmp = head?.next
            head?.next = cur
            cur = head
            head = tmp
        }
        return cur
        
    }
}
