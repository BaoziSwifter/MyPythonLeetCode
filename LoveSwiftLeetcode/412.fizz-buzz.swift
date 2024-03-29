/*
 * @lc app=leetcode.cn id=412 lang=swift
 *
 * [412] Fizz Buzz
 */

// @lc code=start
class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var tmp:[String] = []
        for i in 1...n {
            if i%5 == 0 && i%3 == 0 {
                tmp.append("FizzBuzz")
            }else if i%3 == 0 {
                tmp.append("Fizz")
            }else if i%5 == 0 {
                tmp.append("Buzz")
            }else{
                tmp.append("\(i)")
            }
        }
        return tmp
    }
}
// @lc code=end

