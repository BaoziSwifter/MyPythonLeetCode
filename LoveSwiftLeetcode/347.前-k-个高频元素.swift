/*
 * @lc app=leetcode.cn id=347 lang=swift
 *
 * [347] 前 K 个高频元素
 */

// @lc code=start
class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var map = [Int: Int]()
        for v in nums {
            map[v, default: 0] += 1
        }
        if map.count <= k { return [Int](map.keys) }
        let res = map.sorted { v1, v2 in
            v1.value > v2.value
        }.compactMap { (key: Int, value: Int) in
            key
        }
        return Array(res[..<k])
    }
}
// @lc code=end

