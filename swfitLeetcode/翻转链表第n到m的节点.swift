import Foundation

public class CListNode:Equatable {
    public var val = 0
    public var next: CListNode?
    public init(v: Int) {
        self.val = v
        self.next = nil
    }
    public init(_ val: Int,_ next: CListNode?) {
        self.val = val
        self.next = next
    }

    public static func ==(lhs: CListNode, rhs: CListNode) -> Bool {
        return lhs.val == rhs.val
    }
}

func reverseBetween(_ head: CListNode?, begin: Int, end: Int) -> CListNode? {
    if begin >= end || head == nil {
        return head
    }
    var right = head
    var left = head
    var rightStep = 0
    var leftStep = 0
    while rightStep < end {
        rightStep += 1
        right = right?.next
        if leftStep < begin - 1 {
            leftStep += 1
            left = left?.next
        }
    }
    let tmpRight = right?.next
    right?.next = nil
    var tmpLeft = left?.next
    while tmpLeft?.next != nil {
        let t = tmpLeft?.next
        tmpLeft?.next = tmpLeft
        tmpLeft = t
        
    }
    left?.next?.next = tmpRight
    left?.next = tmpLeft
    
//    MArk todo
    return nil

}
