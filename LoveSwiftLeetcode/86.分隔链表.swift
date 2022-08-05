/*
 * @lc app=leetcode.cn id=86 lang=swift
 *
 * [86] 分隔链表
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
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var head = head
        let dumyLeft = ListNode(-1)
        let dumyRight = ListNode(-1)
        var dl: ListNode? = dumyLeft, dr: ListNode? = dumyRight
        while head != nil {
            if head!.val < x {
                dl!.next = head
                dl = dl!.next
            } else {
                dr!.next = head
                dr = dr!.next
            }
            let tmp = head?.next
            head?.next = nil
            head = tmp
        }
        dl?.next = dumyRight.next
        return dumyLeft.next
    }
}
// @lc code=end

