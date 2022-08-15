/*
 * @lc app=leetcode.cn id=207 lang=swift
 *
 * [207] 课程表
 */

// @lc code=start
class LessonSolution {
    var tu = [[Int]]()
    var marks = [Int]()
    var res = true

    func dfs(curIndex: Int) {
        marks[curIndex] = -1
        for child in tu[curIndex] {
            if marks[child] == -1 {
                res = false
                return
            } else if marks[child] == 0 {
                dfs(curIndex: child)
                if !res {
                    return
                }
            }
        }
        marks[curIndex] = 1
    }

    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        tu = [[Int]](repeating: [], count: numCourses)
        for e in prerequisites {
            tu[e[1]].append(e[0])
        }
        marks = [Int](repeating: 0, count: numCourses)
        for v in 0..<numCourses {
            if marks[v] == 0 {
                dfs(curIndex: v)
            }
        }
        return res
    }
}
// @lc code=end

