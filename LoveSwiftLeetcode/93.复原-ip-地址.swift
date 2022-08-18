/*
 * @lc app=leetcode.cn id=93 lang=swift
 *
 * [93] 复原 IP 地址
 */

// @lc code=start
class Solution {
    func restoreIpAddresses(_ s: String) -> [String] {
        var res = [String]()
        var tmp = [String]()
    
        let chs: [Character] = [Character](s)
        backTrace(&res, &tmp, chs, 0, 0)
        return res
    }
    func backTrace(_ res: inout [String], _ tmp: inout [String], _ chs: [Character], _ index: Int, _ has: Int) {
        if index == chs.count && has == 4 {
            res.append(tmp.joined(separator: "."))
            return
        }
        if (has == 4 && index < chs.count) || (index == chs.count && has < 4) {
            return
        }
        for i in index ... index+2 {
            if i >= chs.count { break }
            if i > index && chs[index] == "0" { break }
            let str: String = String(chs[index...i])
            if str.count == 3 && str > "255" {
                continue
            }
            tmp.append(str)
            backTrace(&res, &tmp, chs, i + 1, has + 1)
            tmp.removeLast()
        }
    }
}
// @lc code=end

