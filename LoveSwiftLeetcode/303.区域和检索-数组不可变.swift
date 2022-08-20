/*
 * @lc app=leetcode.cn id=303 lang=swift
 *
 * [303] 区域和检索 - 数组不可变
 */

// @lc code=start

class NumArray {
    var preNums: [Int]
    init(_ nums: [Int]) {
        preNums = [Int](repeating: 0, count: nums.count + 1)
        for i in 1..<preNums.count {
            preNums[i] = preNums[i-1] + nums[i-1]
        }
    }
     
    func sumRange(_ left: Int, _ right: Int) -> Int {
        return preNums[right + 1] - preNums[left]
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * let ret_1: Int = obj.sumRange(left, right)
 */
// @lc code=end

