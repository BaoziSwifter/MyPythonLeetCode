//
//  785.-判断二分图.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution785 {
    func isBipartite(_ graph: [[Int]]) -> Bool {
        let length = graph.count
        var color = [Int](repeating: -1, count: length)
        for i in 0 ..< length {
            if color[i] == -1 {
                var queue = [Int]()
                while queue.isEmpty == false {
                    guard let p = queue.popLast() else {
                        continue
                    }
                    for j in graph[p] {
                        if color[j] == -1 {
                            queue.append(j)
                            color[j] = color[p]^1
                        } else if color[j] == color[p] {
                            return false
                        }
                    }
                    
                }
            }
        }
        return true
    }
}
