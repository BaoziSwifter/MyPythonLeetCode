/*
 * @lc app=leetcode.cn id=448 lang=swift
 *
 * [448] 找到所有数组中消失的数字
 */

// @lc code=start
class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        if nums.count <= 1 { return [] }
        var records = [Int](repeating: -1, count: nums.count)
        for n in nums {
            records[n-1] += 1
        }
        var res = [Int]()
        var index = 0
        for n in records {
            if n == -1 {
                res.append(index + 1)
            }
            index += 1
        }
        return res
    }
}
// @lc code=end

