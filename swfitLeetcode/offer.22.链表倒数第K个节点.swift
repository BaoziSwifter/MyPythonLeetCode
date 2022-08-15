import Foundation

// leetcode offer 22
class Solution_offer_22 {
    func getKthFromEnd_2_pointer(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil || k == 0 {
            return nil
        }
        var fast = head
        var slow = head
        for _ in 0..<k-1 {
            if let p = fast?.next {
                fast = p
            } else {
                return nil
            }
        }
        while fast?.next != nil {
            fast = fast?.next
            slow = slow?.next
        }
        return slow
        
    }
    
    
    func getKthFromEnd_counter(_ head: ListNode?, _ k: Int) -> ListNode? {
        var count = 0
        func find(_ head:ListNode?, k: Int) -> ListNode? {
            guard let _ = head else {
                return nil
            }
            let res:ListNode? = find(head?.next, k: k)
            count += 1
            if count == k {
                return head
            }
            
            return res
        }
        return find(head?.next, k: k)
    }
}
