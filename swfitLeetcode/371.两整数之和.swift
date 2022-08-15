/*
 * @lc app=leetcode.cn id=371 lang=swift
 *
 * [371] 两整数之和
 */

// @lc code=start
class TwoSumSolution {
    func getSum(_ a: Int, _ b: Int) -> Int {
                var left = a^b
        var carry = (a&b)<<1
        while carry != 0 {
            (left,carry) = (left^carry, (left & carry) << 1 )
        }
        return left
    }
}
// @lc code=end

