//
//  210.-课程表-ii.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation

class Solution210 {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var onPath = [Bool](repeating: false, count: numCourses)
        var visited = [Bool](repeating: false, count: numCourses)
        var hasCycle = false
        var graph = [[Int]](repeating: [], count: numCourses)
        var posterRes = [Int]()
        // 构建图
        for p in prerequisites {
            let from = p[1], to = p[0]
            graph[from].append(to)
        }
        for i in 0..<numCourses {
            // 遍历图
            traverse(i)
        }
        
        func traverse(_ g: Int) {
            if onPath[g] { hasCycle = true }
            if visited[g] || hasCycle { return }
            onPath[g] = true
            visited[g] = true
            for to in graph[g] {
                traverse(to)
            }
            onPath[g] = false
            posterRes.append(g)
        }
        if hasCycle { return [] }
        return posterRes.reversed()
    }
}
