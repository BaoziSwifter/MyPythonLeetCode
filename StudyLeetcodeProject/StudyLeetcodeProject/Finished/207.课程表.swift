//
//  207.-课程表.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution207 {
    func canFinish_1(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var tu = [[Int]](repeating: [], count: numCourses)
        var marks = [Int](repeating: 0, count: numCourses)
        var res = true
        for p in prerequisites {
            tu[p[1]].append(p[0])
        }
        for v in 0..<numCourses {
            if marks[v] == 0 {
                dfs(v)
            }
        }
        func dfs(_ course: Int) {
            marks[course] = -1
            for c in tu[course] {
                if marks[c] == -1 {
                    res = false
                } else if marks[c] == 0 {
                    dfs(c)
                    if res == false {
                        return
                    }
                }
            }
            marks[course] = 1
        }
        return res
    }
    
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var onPath = [Bool](repeating: false, count: numCourses)
        var visited = [Bool](repeating: false, count: numCourses)
        var hasCycle = false
        var graph = [[Int]](repeating: [], count: numCourses)
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
            if onPath[g] {
                // 出现环
                hasCycle = true
            }
            // 出现环，不用继续遍历
            if visited[g] || hasCycle { return }
            // 前序遍历，添加标记
            visited[g] = true
            onPath[g] = true
            for to in graph[g] {
                traverse(to)
            }
            // 后序遍历恢复
            onPath[g] = false
        }
        
        return !hasCycle
    }
}
