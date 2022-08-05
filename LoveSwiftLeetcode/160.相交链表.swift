/*
 * @lc app=leetcode.cn id=160 lang=swift
 *
 * [160] 相交链表
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
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var pA = headA, pB = headB
               var countA = 0, countB = 0
        while pA != nil {
            countA += 1
            pA = pA?.next
        }
        while pB != nil {
            countB += 1
            pB = pB?.next
        }
        pA = headA; pB = headB
        if countB < countA {
            for _ in 0..<countA-countB {
                pA = pA?.next
            }
        } else {
            for _ in 0..<countB-countA {
                pB = pB?.next
            }
        }
        
        while true {
            if pA === pB {
                break
            }
            pA = pA?.next
            pB = pB?.next
        }
        return pA
    }
}
// @lc code=end

