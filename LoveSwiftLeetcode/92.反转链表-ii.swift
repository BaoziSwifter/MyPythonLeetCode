/*
 * @lc app=leetcode.cn id=92 lang=swift
 *
 * [92] 反转链表 II
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
    
    func reverseBetween_1(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if left == 1 {
            return reverseN(head, right)
        }
        head?.next = reverseBetween(head?.next, left - 1, right - 1)
        return head
    }
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        guard left <= right , head != nil else {
            return nil
        }
        let dumy:ListNode? = ListNode()
        dumy?.next = head
        var pre = dumy
        for _ in 0..<(left - 1) {
            pre = pre?.next
        }
        var cur = pre?.next
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
// @lc code=end

