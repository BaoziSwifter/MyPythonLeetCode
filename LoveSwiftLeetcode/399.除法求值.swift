/*
 * @lc app=leetcode.cn id=399 lang=swift
 *
 * [399] 除法求值
 */

// @lc code=start
class Solution {
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var res = [Double]()
        var visited = Set<String>()
        var tableData = [String: [String: Double]]()
        for i in 0 ..< values.count {
            let a = equations[i][0]
            let b = equations[i][1]
            if tableData[a] != nil {
                tableData[a]![b] = values[i]
            } else {
                tableData[a] = [b: values[i]]
            }
            
            if tableData[b] != nil {
                tableData[b]![a] = 1.0/values[i]
            } else {
                tableData[b] = [a: 1.0/values[i]]
            }
        }
        
        func calcEquationDFS(_ key: String, _ dest: String, _ sum: Double) -> Double {
            if tableData[key] == nil || visited.contains(key) {
                return -1.0
            }
            if key == dest {
                return sum
            }
            visited.insert(key)
            for (a, b) in tableData[key]! {
                let t = calcEquationDFS(a, dest, sum * b)
                if t != -1.0 {
                    return t
                }
            }
            return -1.0
        }
        
        for i in queries {
            visited.removeAll()
            let r = calcEquationDFS(i[0], i[1], 1)
            res.append(r)
        }
        return res
    }
}
// @lc code=end

