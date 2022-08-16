//
//  25.-k-个一组翻转链表.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution25 {
    // 翻转 链表 [a -> b)
    func reverseA2B(_ a: ListNode?, _ b: ListNode?) -> ListNode? {
        var pre:ListNode?
        var cur = a
        var next = a
        while cur !== b {
            next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }

    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil { return nil }
        let a = head
        var b = head
        for _ in 0..<k {
            if b == nil { return head }
            b = b?.next
        }
        
        // 翻转前k个元素
        let h = reverseA2B(a, b)
        // 递归翻转后续的链表并连接起来
        a?.next = reverseKGroup(b, k)
        return h
    }
}
