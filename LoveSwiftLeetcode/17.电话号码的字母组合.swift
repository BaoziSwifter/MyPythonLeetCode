/*
 * @lc app=leetcode.cn id=17 lang=swift
 *
 * [17] 电话号码的字母组合
 */

// @lc code=start
class Solution {
    let dict: [Character: String] = [
        "0": "",
        "1": "",
        "2": "abc",
        "3": "def",
        "4": "ghi",
        "5": "jkl",
        "6": "mno",
        "7": "pqrs",
        "8": "tuv",
        "9": "wxyz"
    ]
    // MARK: 动态规划
    func letterCombinations(_ digits: String) -> [String] {
    
        if digits.count == 0 {
            return []
        }
        var res = [String]()
        var track = [Character]()
        backtrack(digits, 0, &track, &res)
        return res
    }
    
    func backtrack(_ digits: String, _ start: Int, _ track: inout [Character], _ res: inout [String]) {
        if track.count == digits.count {
            res.append(String(track))
            return
        }
        let chars = Array(digits)
        for i in start..<digits.count {
            let s = Array(dict[chars[i]]!)
            for c in s {
                track.append(c)
                backtrack(digits, i + 1, &track, &res)
                track.removeLast()
            }
        }
    }
}
// @lc code=end

