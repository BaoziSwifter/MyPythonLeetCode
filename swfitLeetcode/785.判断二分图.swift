/*
 * @lc app=leetcode.cn id=785 lang=swift
 *
 * [785] 判断二分图
 */

// @lc code=start
class BipartiteSolution {
  func isBipartite(_ graph: [[Int]]) -> Bool {
		let length  = graph.count

		var color = Array(repeating: -1, count: length)
		for i in 0 ..< length {
			if color[i] == -1 {
				var queue = [Int]()
				queue.append(i)
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
// @lc code=end
