/*
 * @lc app=leetcode.cn id=61 lang=swift
 *
 * [61] 旋转链表
 */

// @lc code=start
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func rotateRight_while(_ head: ListNode?, _ k: Int) -> ListNode? {
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

    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
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
// @lc code=end

