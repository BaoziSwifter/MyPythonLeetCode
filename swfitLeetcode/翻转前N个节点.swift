public class BListNode:Equatable {
    public var val = 0
    public var next: BListNode?
    public init(v: Int) {
        self.val = v
        self.next = nil
    }
    public init(_ val: Int,_ next: BListNode?) {
        self.val = val
        self.next = next
    }

    public static func ==(lhs: BListNode, rhs: BListNode) -> Bool {
        return lhs.val == rhs.val
    }
}

var passNode: BListNode? = nil

func inner_recursion_reverseN(_ head: BListNode?, n: Int) -> BListNode? {
    if n < 2 {
        passNode = head?.next
        return head
    }
    let lastNode = inner_recursion_reverseN(head?.next, n: n-1)
    head?.next?.next = head
    head?.next = passNode
    return lastNode
    
}

// 翻转前n个链表 非递归
func inner_norecursion_reverseN(_ head: BListNode?, n: Int) -> BListNode? {
    if n < 2 {
        return head
    }
    var i = 0
    var head = head, pre: BListNode? = nil
    let first = head
    while i < n {
        let t = head?.next
        head?.next = pre
        pre = head
        head = t
        i += 1
    }
    first?.next = head
    return pre

}
