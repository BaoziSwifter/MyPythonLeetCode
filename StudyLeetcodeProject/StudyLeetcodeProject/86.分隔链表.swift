//
//  Leetcode86.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/5.
//

import Foundation

// [86] 分隔链表

public class ListNode86 {
    public var val: Int
    public var next: ListNode86?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    public init(_ val: Int, _ next: ListNode86?) {
        self.val = val;
        self.next = next;
    }
}

class Solution86 {
    func partition(_ head: ListNode86?, _ x: Int) -> ListNode86? {
        var head = head
        let dumyLeft = ListNode86(-1)
        let dumyRight = ListNode86(-1)
        var dl: ListNode86? = dumyLeft, dr: ListNode86? = dumyRight
        while head != nil {
            if head!.val < x {
                dl!.next = head
                dl = dl!.next
            } else {
                dr!.next = head
                dr = dr!.next
            }
            let tmp = head?.next
            head?.next = nil
            head = tmp
        }
        dl?.next = dumyRight.next
        return dumyLeft.next
    }
}
