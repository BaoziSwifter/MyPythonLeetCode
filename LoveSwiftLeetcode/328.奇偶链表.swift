/*
 * @lc app=leetcode.cn id=328 lang=swift
 *
 * [328] 奇偶链表
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
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        let odd = ListNode()
        var cur_odd: ListNode? = odd
        let even = ListNode()
        var cur_even: ListNode? = even
        var i = 0
        var h = head
        while h != nil {
            let n = h?.next
            if i % 2 == 0 {
                cur_odd?.next = h
                cur_odd = cur_odd?.next
            } else {
                cur_even?.next = h
                cur_even = cur_even?.next
            }
            h?.next = nil
            i += 1
            h = n
        }
        cur_odd?.next = even.next
        return odd.next
    }
}
// @lc code=end

