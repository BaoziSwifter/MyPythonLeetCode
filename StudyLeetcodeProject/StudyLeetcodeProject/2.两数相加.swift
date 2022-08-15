//
//  2.两数相加.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/15.
//

import Foundation

class Solution2 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1, l2 = l2
        var needAddOne = 0
        let dumy = ListNode()
        var head = dumy
        while l1 != nil || l2 != nil {
            let value = (l1?.val ?? 0) + (l2?.val ?? 0) + needAddOne
            head.next = ListNode(value % 10)
            needAddOne = value / 10
            head = head.next!
            l1 = l1?.next
            l2 = l2?.next
        }
        if needAddOne == 1 {
            head.next = ListNode(1)
        }
        return dumy.next
    }
}
