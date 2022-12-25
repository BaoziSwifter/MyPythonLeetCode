//
//  61.-旋转链表.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution61 {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil || k < 1 {
            return head
        }
        var cnt = 0
        var p = head
        while p != nil {
            p = p?.next
            cnt += 1
        }
        
        let stepK = k % cnt
        if stepK == 0 { return head }
        var step = 0
        var fast = head
        while step < stepK {
            step += 1
            fast = fast?.next
        }
        var slow = head
        while fast?.next != nil {
            fast = fast?.next
            slow = slow?.next
        }
        let newHead = slow?.next
        slow?.next = nil
        fast?.next = head
        return newHead
    }
    
    func rotateRight_circle(_ head: ListNode?, _ k: Int) -> ListNode? {
        var last: ListNode? = head
        var length = 1
        while last?.next != nil {
            last = last?.next
            length += 1
        }
        // 合成环
        last?.next = head

        var newHead = head
        var newTail = last
        var step = length - k % length
        while step != 0 {
            step -= 1
            newHead = newHead?.next
            newTail = newTail?.next
        }
        newTail?.next = nil
        return newHead

    }
}
