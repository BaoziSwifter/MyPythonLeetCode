/*
 * @lc app=leetcode.cn id=23 lang=swift
 *
 * [23] 合并K个升序链表
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
   func merge2Lists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let dumyNode = ListNode()
        var h = dumyNode
        var l1 = list1, l2 = list2
        while l1 != nil  && l2 != nil {
            if l1!.val < l2!.val {
                h.next = l1
                l1 = l1?.next
            } else {
                h.next = l2
                l2 = l2?.next
            }
            h = h.next!
        }
        h.next = l1 ?? l2
        return dumyNode.next
    }
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.count == 0 {
            return nil
        }
        if lists.count == 1{
            return lists[0]
        }
        let mid = lists.count / 2
        let left = mergeKLists(Array(lists[0..<mid]))
        let right = mergeKLists(Array(lists[mid..<lists.count]))
        return merge2Lists(left, right)
    }
}
// @lc code=end

