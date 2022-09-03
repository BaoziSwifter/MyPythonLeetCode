/*
 * @lc app=leetcode.cn id=71 lang=swift
 *
 * [71] 简化路径
 */

// @lc code=start
class Solution {
    func simplifyPath(_ path: String) -> String {
        let parts = path.split(separator: "/").compactMap { String($0) }
        var stack = [String]()
        for p in parts {
            if p.isEmpty || p == "." { continue }
            if p == ".." {
                if !stack.isEmpty { let _ = stack.popLast() }
                continue
            }
            stack.append(p)
        }
        return "/"+stack.joined(separator: "/")
    }
}
// @lc code=end

