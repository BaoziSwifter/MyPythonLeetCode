/*
 * @lc app=leetcode.cn id=234 lang=swift
 *
 * [234] 回文链表
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
// @lc code=end

