/*
 * @lc app=leetcode.cn id=2 lang=swift
 *
 * [2] 两数相加
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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1, l2 = l2
        var needAddOne = 0
        let dumy = ListNode()
        var head = dumy
        while l1 != nil || l2 != nil {
            let value = (l1?.val ?? 0) + (l2?.val ?? 0) + needAddOne
            head.next = ListNode(value % 10)
            needAddOne = value / 10
            head = head.next!
            l1 = l1?.next
            l2 = l2?.next
        }
        if needAddOne == 1 {
            head.next = ListNode(1)
        }
        return dumy.next
    }
}
// @lc code=end

