//
//  234.回文链表.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution234 {
    var left: ListNode?
    func isPalindrome(_ head: ListNode?) -> Bool {
        left = head
        return traverse(head)
    }
    func traverse(_ head: ListNode?) -> Bool {
        if head == nil { return true }
        var res = traverse(head?.next)
        
        // 后续遍历
        res = (res && (head?.val == left?.val))
        left = left?.next
        return res
    }
}
