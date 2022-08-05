//
//  Leetcode160.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/5.
//

import Foundation

// [160] 相交链表

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var pA = headA, pB = headB
//        while true {
//            if pA === pB {
//                break
//            }
//            if pA == nil {
//                pA = headB
//            } else {
//                pA = pA?.next
//            }
//
//            if pB == nil {
//                pB = headA
//            } else {
//                pB = pB?.next
//            }
//        }
//        return pA
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


class Solution2 {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if headA == nil || headB == nil {
            return nil
        }
        var pA: ListNode? = headA
        var pB: ListNode? = headB

        while pA !== pB {
            pA = (pA == nil) ? headB : (pA?.next)
            pB = (pB == nil) ? headA : (pB?.next)
        }
        return pA
    }
}

