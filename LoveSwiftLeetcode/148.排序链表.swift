/*
 * @lc app=leetcode.cn id=148 lang=swift
 *
 * [148] 排序链表
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
// @lc code=end

