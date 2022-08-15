/*
 * @lc app=leetcode.cn id=9 lang=swift
 *
 * [9] 回文数
 */

// @lc code=start
class PalindromeSolution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }else {
            var l = 0;
            var sum = 0
            let o = x
            var x = x
            while x != 0 {
                l = x%10
                sum=sum*10+l
                x = x / 10
            }
            return sum == o
        }
    }
}
// @lc code=end

