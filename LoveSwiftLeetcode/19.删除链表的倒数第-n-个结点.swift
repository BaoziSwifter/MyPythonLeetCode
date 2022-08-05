/*
 * @lc app=leetcode.cn id=19 lang=swift
 *
 * [19] 删除链表的倒数第 N 个结点
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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dumy = ListNode()
        dumy.next = head
        var tail: ListNode? = dumy
        var res: ListNode? = dumy
        var index = 0
        while index < n + 1 {
            guard let t = tail else {
                break
            }
            tail = t.next
            index += 1
        }
        
        while tail != nil {
            tail = tail?.next
            res = res?.next
        }
        res?.next = res?.next?.next
        return dumy.next
    }
}
// @lc code=end

