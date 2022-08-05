//
//  Leetcode142.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/5.
//

import Foundation

class Solution142 {
    func detectCycle(_ head: ListNode?) -> ListNode? {
         var fast = head, slow = head
         while fast != nil && fast?.next != nil {
             fast = fast?.next?.next
             slow = slow?.next
             if slow === fast {
                 break
             }
         }
         if fast == nil || fast?.next == nil {
             return nil
         }
         slow = head
         while true {
             if fast === slow {
                 break
             }
             fast = fast?.next
             slow = slow?.next
         }
         return slow
     }
}

