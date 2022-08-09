//
//  ListNode.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/9.
//

import Foundation

class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() {
        self.val = -1
        self.next = nil
    }
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val;
        self.next = next;
    }
}

func printListNode(head: ListNode?) {
    if head == nil { return }
    // 按顺序打印
    printListNode(head: head?.next)
    print("-->\(head!.val)")
}
