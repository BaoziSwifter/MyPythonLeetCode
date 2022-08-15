/*
 * @lc app=leetcode.cn id=141 lang=swift
 *
 * [141] 环形链表
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

 
//  extension ListNode:Hashable,Equatable {
//      public func hash(into hasher: inout Hasher) {
//          hasher.combine(val)
//          hasher.combine(ObjectIdentifier(self))
//      }

//      public static func == (lhs: ListNode,rhs:ListNode) -> Bool{
//          return lhs === rhs
//      }
//  }
 

class ListNodeCycleSolution {
    func hasCycle(_ head: ListNode?) -> Bool {
       if head == nil || head?.next == nil {
           return false
       }
       var slow = head
       var fast = head?.next 

       while slow?.val != fast?.val {
           if slow == nil || fast == nil {
               return false
           }
           slow = slow?.next 
           fast = fast?.next?.next
       }
       return true
    }
}
// @lc code=end

