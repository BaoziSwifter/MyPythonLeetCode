//
//  Leetcode19.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/5.
//

import Foundation
// [19] 删除链表的倒数第 N 个结点

class Solution19 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dumy = ListNode()
        dumy.next = head
        var tail: ListNode? = dumy
        var res: ListNode? = dumy
        var index = 0
        while index < n + 1 {
            guard let t = tail else {
                break
            }
            tail = t.next
            index += 1
        }
        
        while tail != nil {
            tail = tail?.next
            res = res?.next
        }
        res?.next = res?.next?.next
        return dumy.next
    }
}
