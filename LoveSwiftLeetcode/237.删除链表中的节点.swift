/*
 * @lc app=leetcode.cn id=237 lang=swift
 *
 * [237] 删除链表中的节点
 */

// @lc code=start
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func deleteNode(_ node: ListNode?) {
        guard let cur = node else {
            return
        }
        cur.val = cur.next!.val
        cur.next = cur.next!.next
    }
}
// @lc code=end

