import Foundation



 
class Solution_92 {
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        guard left <= right && head != nil else {
            return nil
        }
        let dumy: ListNode? = ListNode(0)
        dumy?.next = head
        
        var pre = dumy
        for _ in 0..<left-1 {
            pre = pre?.next
        }
        
        let cur = pre?.next
        for _ in left..<right {
            let next = cur?.next
            cur?.next = next?.next
            next?.next = pre?.next
            pre?.next = next
        }
        return dumy?.next
    }
}
