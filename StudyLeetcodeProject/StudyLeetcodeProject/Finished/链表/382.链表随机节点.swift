//
//  382.-链表随机节点.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/13.
//

import Foundation


class Solution382 {
    var head: ListNode?
    init(_ head: ListNode?) {
        self.head = head
    }
    
    func getRandom() -> Int {
        var p = head
        var res = 0
        var count = 0
        while p != nil {
            count += 1
            let rand = Int.random(in: 1...count)
            if rand == count {
                res = p!.val
            }
            p = p?.next
        }
        return res
    }
}
