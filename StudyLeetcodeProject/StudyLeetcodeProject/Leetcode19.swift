//
//  Leetcode19.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/5.
//

import Foundation
// [19] 删除链表的倒数第 N 个结点

class ListNode19 {
    public var val: Int
    public var next: ListNode19?
    public init() {
        self.val = -1
        self.next = nil
    }
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    public init(_ val: Int, _ next: ListNode19?) {
        self.val = val;
        self.next = next;
    }
}

class Solution19 {
    func removeNthFromEnd(_ head: ListNode19?, _ n: Int) -> ListNode19? {
        let dumy = ListNode19()
        dumy.next = head
        var tail: ListNode19? = dumy
        var res: ListNode19? = dumy
        var index = 0
        while index < n + 1 {
            guard let t = tail else {
                break
            }
            tail = t.next
            index += 1
        }
        
        while tail != nil {
            tail = tail?.next
            res = res?.next
        }
        res?.next = res?.next?.next
        return dumy.next
    }
}
