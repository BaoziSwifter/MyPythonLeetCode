//
//  116.-填充每个节点的下一个右侧节点指针.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution116 {
    func connect(_ root: Node?) -> Node? {
        guard let root = root else {
            return nil
        }
        
        var q = [root]
        while q.isEmpty == false {
            var tmp = [Node]()
            let cnt = q.count
            for i in 0..<cnt {
                if i < cnt - 1 {
                    q[i].next = q[i + 1]
                }
                if let l = q[i].left {
                    tmp.append(l)
                }
                if let r = q[i].right {
                    tmp.append(r)
                }
            }
            q = tmp
        }
        return root
    }
    
    func connect_traverse(_ root: Node?) -> Node? {
        if root == nil { return nil }
        traverse(root?.left, root?.right)
        return root
    }
    func traverse(_ left: Node?, _ right: Node?) {
        if left == nil || right == nil { return }
        // 前序位置
        left?.next = right
        traverse(left?.left, left?.right)
        traverse(right?.left, right?.right)
        traverse(left?.right, right?.left)
    }
}
