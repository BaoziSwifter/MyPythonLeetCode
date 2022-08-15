/*
 * @lc app=leetcode.cn id=142 lang=swift
 *
 * [142] 环形链表 II
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
 /*
 定义两个指针，其中slow指针每次走一步，fast指针每次走两步。可能有两种情况：

没有环状，则fast指针会走到末端，值为nil
有环状，则fast指针和slow指针会在某个节点相遇，第一次相遇时，分析两个指针的步数关系：
假设链表头部到环形入口的节点（不计环形入口的那个节点）个数为a，环形链表的节点个数为b，则链表的节点总个数为a + b; 设两指针的步数分别为f和s。
因为fast每次走两步，slow走一步，所以肯定有一个关系为：f = 2s
当两指针相遇时，fast比slow多走了环的整数倍，即：f = s + nb
对以上两个等式相减得：s = nb, f = 2nb
当指针走了*a + mb(m为整数)*步时，此时指针将指向环形入口节点。
当第一次相遇的时候，slow走了n圈的环，所以只要再走a步就可以到环形入口节点。但a是未知的，不过刚好如果从head头部开始走，到环形入口节点也刚好是a步（此时m为0）。即第一次相遇的时候，让fast回到head，然后fast和slow以每次一步的速度遍历，当两个指针相遇时，相遇节点为环形入口节点
*/

class DetectCycleSolution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var fast = head 
        var slow = head
        repeat {
            if fast == nil || slow == nil {
                return nil
            }
            fast = fast?.next?.next
            slow = slow?.next
        } while fast !== slow

        slow = head
        while fast !== slow {
            fast = fast?.next
            slow = slow?.next  
        }
        return fast
    }
}
// @lc code=end

