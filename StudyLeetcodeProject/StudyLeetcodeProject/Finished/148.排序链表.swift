//
//  148.-排序链表.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution148 {
    // 并归
    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
        var slow = head
        var fast = head?.next
        while slow != nil, fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        let mid = slow?.next
        slow?.next = nil
        var left = sortList(head)
        var right = sortList(mid)
        var dumy = ListNode()
        let res = dumy
        
        while left != nil, right != nil {
            if left!.val < right!.val {
                dumy.next = left
                left = left?.next
            } else {
                dumy.next = right
                right = right?.next
            }
            dumy = dumy.next!
        }
        dumy.next = left == nil ? right : left
        return res.next
    }
}
