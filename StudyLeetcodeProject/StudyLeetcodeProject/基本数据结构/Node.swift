//
//  Node.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/24.
//

import Foundation

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
      public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

public class BFSNode {
    public static func == (lhs: BFSNode, rhs: BFSNode) -> Bool {
        if lhs.val != rhs.val {
            return false
        }
        if lhs.nexts.count != rhs.nexts.count {
            return false
        }
        for i in 0..<lhs.nexts.count {
            if lhs.nexts[i] == rhs.nexts[i] {
                continue
            }
            return false
        }
        return true
    }
    
    public var val: Int = 0
    public var nexts: [BFSNode] = [BFSNode]()
    
    
}

//func BFS(_ start: BFSNode, _ end: BFSNode) -> Int {
//    var queue = [BFSNode]()
//    
//    var visited = Set<BFSNode>()
//    queue.append(start)
//    visited.insert(start)
//    var step = 0
//    while queue.isEmpty == false {
//        let sz = queue.count
//        for _ in 0 ..< sz {
//            let cur = queue.removeFirst()
//            if cur == end {
//                return step
//            }
//            for i in cur.nexts {
//                if visited.contains(i){ continue }
//                queue.append(i)
//                visited.insert(i)
//            }
//        }
//        step += 1
//    }
//    return -1
//}


