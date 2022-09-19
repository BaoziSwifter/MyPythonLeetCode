/*
 * @lc app=leetcode.cn id=301 lang=swift
 *
 * [301] 删除无效的括号
 */

// @lc code=start
class Solution {
    func removeInvalidParentheses(_ s: String) -> [String] {
        func isValid(_ s: String) -> Bool {
            var count = 0
            for c in s {
                if c == "(" {
                    count += 1
                } else if c == ")" {
                    count -= 1
                }
                
                if count < 0 {
                    return false
                }
            }
            return count == 0
        }
        
        var res = [String]()
        var queue = [String]()
        
        queue.append(s)
        var visited = Set<String>()
        visited.insert(s)
        var found = false
        
        while !queue.isEmpty {
            let str = queue.removeFirst()
            if isValid(str) {
                res.append(str)
                found = true
            }
            if found {
                continue
            }
            
            for i in 0..<str.count {
                let val = str[str.index(str.startIndex, offsetBy: i)]
                if val != "(", val != ")" {
                    continue
                }
                let startIndex = str.index(str.startIndex, offsetBy: i)
                let endIndex = str.index(str.startIndex, offsetBy: i+1)
                let newStr = str.replacingCharacters(in: startIndex..<endIndex, with: "")
                if !visited.contains(newStr) {
                    queue.append(newStr)
                    visited.insert(newStr)
                }
            }
        }
        return res
    }
}
// @lc code=end

