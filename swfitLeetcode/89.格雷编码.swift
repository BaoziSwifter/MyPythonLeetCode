/*
 * @lc app=leetcode.cn id=89 lang=swift
 *
 * [89] 格雷编码
 */

// @lc code=start
class GrayCodeSolution {
    func grayCode(_ n: Int) -> [Int] {
        if n == 0 {
            return [0]
        }
        var res = [0]
        for i in 0..<n {
            let addVal = 1 << i
            let resCpount = res.count
            for index in 0..<resCpount {
                res.append(res[resCpount-1-index]+addVal)
            }
        }
        return res
    }
}
// @lc code=end

