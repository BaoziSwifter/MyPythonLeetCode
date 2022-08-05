/*
 * @lc app=leetcode.cn id=21 lang=swift
 *
 * [21] 合并两个有序链表
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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        if l1!.val <= l2!.val {
            l1?.next = mergeTwoLists(l1?.next, l2)
            return l1
        } else {
            l2?.next = mergeTwoLists(l1, l2?.next)
            return l2
        }
    }
    func merge1TwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let dumyNode = ListNode(0)
        var d = dumyNode
        var l1 = list1, l2 = list2
        while l1 != nil && l2 != nil {
            if let a1 = l1, let a2 = l2 {
                if a1.val < a2.val {
                    d.next = l1
                    l1 = l1?.next
                   
                } else {
                    d.next = l2
                    l2 = l2?.next
                }
                d = d.next!
            }
        }
        d.next = l1 ?? l2

        return dumyNode.next
    }
}
// @lc code=end

