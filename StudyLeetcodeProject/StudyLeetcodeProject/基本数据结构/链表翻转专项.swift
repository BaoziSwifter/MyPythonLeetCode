//
//  链表翻转专项.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

// -------------------------------------------------------------------------
// 1 翻转整个链表
// 1.1 迭代法
func reverseNodeList_iteration(_ head: ListNode?) -> ListNode? {
    var pre: ListNode?
    var cur = head
    var next = head
    while cur != nil {
        next = cur?.next
        cur?.next = pre
        
        pre = cur
        cur = next
    }
    return pre
}

// 1.2 递归
func reverseNodeList_recursion(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    let last = reverseNodeList_recursion(head?.next)
    head?.next?.next = head
    head?.next = nil
    return last
}

// -------------------------------------------------------------------------

// 2 翻转前N个节点
// 2.1 迭代法
func reverseNNodeList_iteration(_ head: ListNode?, _ n: Int) -> ListNode? {
    if n == 1 {
        return head
    }
    var head = head
    var pre: ListNode?
    let first = head
    var i = 0
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

// 2.2 递归
var nodeN: ListNode?
func reverseNNodeList_recursion(_ head: ListNode?, _ n: Int) -> ListNode? {
    if n == 1 {
        nodeN = head?.next
        return head
    }
    let lastNode = reverseNNodeList_recursion(head?.next, n - 1)
    head?.next?.next = head
    head?.next = nodeN
    return lastNode

}

// -------------------------------------------------------------------------

// 3 翻转a-b部分链表
// 3.1 递归
func reverseBetween_recursion(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
    if m == 1 {
        return reverseNNodeList_recursion(head, m)
    }
    head?.next = reverseBetween_recursion(head?.next, m - 1, n - 1)
    return head
}

// 3.2 迭代
func reverseBetween_iteration(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
    guard left <= right , head != nil else {
        return nil
    }
    let dumy:ListNode? = ListNode()
    dumy?.next = head
    var pre = dumy
    for _ in 0..<(left - 1) {
        pre = pre?.next
    }
    var cur = pre?.next
    var left = left
    while left < right {
        let next = cur?.next
        cur?.next = next?.next
        next?.next = cur
        cur = next
        left += 1
    }
    return dumy?.next
}

// 翻转 链表 [a -> b)
func reverseA2B(_ a: ListNode?, _ b: ListNode?) -> ListNode? {
    var pre:ListNode?
    var cur = a
    var next = a
    while cur !== b {
        next = cur?.next
        cur?.next = pre
        pre = cur
        cur = next
    }
    return pre
}

func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    if head == nil { return nil }
    let a = head
    var b = head
    for _ in 0..<k {
        if b == nil { return head }
        b = b?.next
    }
    
    // 翻转前k个元素
    let h = reverseA2B(a, b)
    // 递归翻转后续的链表并连接起来
    a?.next = reverseKGroup(b, k)
    return h
}
