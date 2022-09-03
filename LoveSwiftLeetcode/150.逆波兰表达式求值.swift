/*
 * @lc app=leetcode.cn id=150 lang=swift
 *
 * [150] 逆波兰表达式求值
 */

// @lc code=start
class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = tokens
        var res = [Int]()
        let operations = ["+", "-", "*", "/"]
        while stack.count > 0 {
            let opt = stack.removeFirst()
            if !operations.contains(opt) {
                res.append(Int(opt)!)
            } else {
                if res.count >= 2 {
                    let val2 = res.removeLast()
                    let val1 = res.removeLast()
                    switch opt {
                    case "+":
                        res.append(val1 + val2)
                    case "-": res.append(val1 - val2)
                    case "*": res.append(val1 * val2)
                    default:
                        res.append(val1 / val2)
                    }
                }
            }
        }
        return res[0]
    }
}
// @lc code=end

