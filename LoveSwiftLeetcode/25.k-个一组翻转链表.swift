/*
 * @lc app=leetcode.cn id=25 lang=swift
 *
 * [25] K 个一组翻转链表
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
    // 翻转 链表 [a -> b)
    func reverseA2B(_ a: ListNode?, _ b: ListNode?) -> ListNode? {
        var pre:ListNode?
        var cur = a
        var next = a
        while cur !== b {
            next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }

    func reverseKGroup_recursition(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil { return nil }
        let a = head
        var b = head
        for _ in 0..<k {
            if b == nil { return head }
            b = b?.next
        }
        
        // 翻转前k个元素
        let h = reverseA2B(a, b)
        // 递归翻转后续的链表并连接起来
        a?.next = reverseKGroup(b, k)
        return h
    }

    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if k < 2 { return head }
        let dumy = ListNode()
        dumy.next = head
        var pre: ListNode? = dumy
        var begin = head
        while begin != nil {
            var i = 0
            var end = begin
            while i < k - 1 && end != nil {
                end = end?.next
                i += 1
            }
            if end == nil {
                break
            }
            
            let nxt = end?.next
            let tmpEnd = begin
            var tmpBegin = begin
            var tmpPre: ListNode?
            var index = 0
            while index < k {
                let tmpNxt = tmpBegin?.next
                tmpBegin?.next = tmpPre
                tmpPre = tmpBegin
                tmpBegin = tmpNxt
                index += 1
            }
            pre?.next = tmpPre
            tmpEnd?.next = nxt
            begin = tmpBegin
            pre = tmpEnd
        }
        
        return dumy.next
    }
}
// @lc code=end

