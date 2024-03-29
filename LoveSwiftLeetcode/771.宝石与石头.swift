/*
 * @lc app=leetcode.cn id=771 lang=swift
 *
 * [771] 宝石与石头
 */

// @lc code=start
class Solution {
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        let jeSet: Set<Character> = Set(Array(jewels))
        var count = 0
        for c in stones {
            if jeSet.contains(c) {
                count += 1
            }
        }
        return count
    }
}
// @lc code=end

