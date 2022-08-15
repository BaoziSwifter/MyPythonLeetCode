import Foundation
public class AListNode:Equatable {
    public var val = 0
    public var next: AListNode?
    public init(v: Int) {
        self.val = v
        self.next = nil
    }
    public init(_ val: Int,_ next: AListNode?) {
        self.val = val
        self.next = next
    }

    public static func ==(lhs: AListNode, rhs: AListNode) -> Bool {
        return lhs.val == rhs.val
    }
}
// 翻转整个链表 递归
func recursion_reverseList(_ head: AListNode?) -> AListNode? {
    
    if head?.next == nil {
        return head
    }
    let lastNode = recursion_reverseList(head?.next)
    head?.next?.next = head
    head?.next = nil
    return lastNode
}

// 翻转整个链表 非递归
func no_recursion_reverseList(_ head: AListNode?) -> AListNode? {
    var pre: AListNode? = nil
    var tmp = head
    while tmp != nil {
        let next = tmp?.next
        tmp?.next = pre
        pre = tmp
        tmp = next
        
    }
    return pre
}
    

