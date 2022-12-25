//
//  92.反转链表-ii.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution92 {
    // 翻转前N个节点
    var nodeN: ListNode?
    func reverseN(_ head: ListNode?, _ n: Int) -> ListNode? {
        if n == 1 {
            nodeN = head?.next
            return head
        }
        let lastNode = reverseN(head?.next, n - 1)
        head?.next?.next = head
        head?.next = nodeN
        return lastNode
    }
    // 非递归
    func reverseN_2(_ head: ListNode?, _ n: Int) -> ListNode? {
        if n == 1 {
            return head
        }
        var head = head
        var pre: ListNode?
        let first = head
        var i = 0
        while i < n {
            let t = head?.next
            head?.next = pre
            pre = head
            head = t
            i += 1
        }
        first?.next = head
        return pre
    }
    
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if left == 1 {
            return reverseN(head, right)
        }
        head?.next = reverseBetween(head?.next, left - 1, right - 1)
        return head
    }
    
    func reverseBetween_2(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        guard left <= right , head != nil else {
            return nil
        }
        let dumy:ListNode? = ListNode()
        dumy?.next = head
        var pre = dumy
        for _ in 0..<(left - 1) {
            pre = pre?.next
        }
        let cur = pre?.next
        var left = left
        while left < right {
            let next = cur?.next
            cur?.next = next?.next
            next?.next = pre?.next
            pre?.next = next
            left += 1
        }
        return dumy?.next
    }
}
