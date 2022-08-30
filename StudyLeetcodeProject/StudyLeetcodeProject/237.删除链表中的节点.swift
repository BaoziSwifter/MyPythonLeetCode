//
//  237.-删除链表中的节点.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution237 {
    func deleteNode(_ node: ListNode?) {
        guard let cur = node else {
            return
        }
        cur.val = cur.next!.val
        cur.next = cur.next!.next
    }
}
