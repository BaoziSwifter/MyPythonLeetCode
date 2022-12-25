//
//  138.-复制带随机指针的链表.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation


public class Node138: Hashable {
    public var val: Int
    public var next: Node138?
    public var random: Node138?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
        hasher.combine(self)
        hasher.combine(self.next)
        hasher.combine(self.random)
    }
    public static func ==(lhs: Node138, rhs: Node138) -> Bool {
        return false
    }
}


class Solution138 {
    var hashMap = [Node138: Node138]()
    func copyRandomList(_ head: Node138?) -> Node138? {
        if head == nil { return nil }
        if let areadyNodel = hashMap[head!] {
            return areadyNodel
        }
        
        let createNode = Node138(head!.val)
        hashMap[head!] = createNode
        // 递归调用开始next 和random 指针节点
        createNode.next = copyRandomList(head?.next)
        createNode.random = copyRandomList(head?.random)
        return hashMap[head!]
    }
}
