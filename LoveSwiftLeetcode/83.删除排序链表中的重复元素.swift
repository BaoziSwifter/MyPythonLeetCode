/*
 * @lc app=leetcode.cn id=83 lang=swift
 *
 * [83] 删除排序链表中的重复元素
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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var slow: ListNode? = head, fast: ListNode? = head
        while fast != nil {
            if fast?.val != slow?.val {
                slow?.next = fast
                slow = slow?.next
            }
            fast = fast?.next
        }
        slow?.next = nil
        return head
    }
}
// @lc code=end

