/*
 * @lc app=leetcode.cn id=207 lang=swift
 *
 * [207] 课程表
 */

// @lc code=start
class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var onPath = [Bool](repeating: false, count: numCourses)
        var visited = [Bool](repeating: false, count: numCourses)
        var hasCycle = false
        var graph = [[Int]](repeating: [], count: numCourses)
        for p in prerequisites {
            let from = p[1], to = p[0]
            graph[from].append(to)
        }
        for i in 0..<numCourses {
            traverse(i)
        }
        func traverse(_ g: Int) {
            if onPath[g] {
                hasCycle = true
            }
            if visited[g] || hasCycle { return }
            visited[g] = true
            onPath[g] = true
            for to in graph[g] {
                traverse(to)
            }
            onPath[g] = false
        }
        
        return !hasCycle
    }
}
// @lc code=end

