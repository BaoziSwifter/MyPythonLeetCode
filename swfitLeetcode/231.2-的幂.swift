/*
 * @lc app=leetcode.cn id=231 lang=swift
 *
 * [231] 2的幂
 */

// @lc code=start
class IsPowerOfTwoSolution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        var val = n
        while val != 0 {
            if val == 1 {
                return true
            }else{
                let tmpVal = val >> 1
                if tmpVal*2 == val {
                    val = tmpVal
                } else {
                    return false
                }
            }
        }
        return false
    }
}
// @lc code=end

