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
class AddTwoNumersSolution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        var needAddOne = 0

        let fakeHead = ListNode(-1)
        var cur = fakeHead
        while l1 != nil || l2 != nil {
            let new = (l1?.val ?? 0) + (l2?.val ?? 0) + needAddOne
            cur.next = ListNode(new%10)
            needAddOne = new / 10
            cur = cur.next!
            l1 = l1?.next
            l2 = l2?.next
        }
        if needAddOne == 1 {
            cur.next = ListNode(1)
        }
        return fakeHead.next
        }
}
// @lc code=end

