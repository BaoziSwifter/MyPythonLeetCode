//
//  328.奇偶链表.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/18.
//

import Foundation

class Solution328 {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        let odd = ListNode()
        var cur_odd: ListNode? = odd
        let even = ListNode()
        var cur_even: ListNode? = even
        var i = 0
        var h = head
        while h != nil {
            let n = h?.next
            if i % 2 == 0 {
                cur_odd?.next = h
                cur_odd = cur_odd?.next
            } else {
                cur_even?.next = h
                cur_even = cur_even?.next
            }
            h?.next = nil
            i += 1
            h = n
        }
        cur_odd?.next = even.next
        return odd.next

    }
}
