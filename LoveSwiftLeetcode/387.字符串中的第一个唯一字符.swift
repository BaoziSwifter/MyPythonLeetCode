/*
 * @lc app=leetcode.cn id=387 lang=swift
 *
 * [387] 字符串中的第一个唯一字符
 */

// @lc code=start
class Solution {
    func firstUniqChar(_ s: String) -> Int {
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

