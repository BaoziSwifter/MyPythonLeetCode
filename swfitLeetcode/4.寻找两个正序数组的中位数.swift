/*
 * @lc app=leetcode.cn id=4 lang=swift
 *
 * [4] 寻找两个正序数组的中位数
 */

// @lc code=start
class FindMedianSortedArraysSolution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let cnt = nums2.count + nums1.count
        var n1 = 0
        var n2 = 0
        var lastVal = 0
        var curVal = 0

        while n1 + n2 <= cnt / 2 {
            lastVal = curVal
            if n2 >= nums2.count || (n1 < nums1.count && nums1[n1] <= nums2[n2]) {
                curVal = nums1[n1]
                n1 += 1
            } else {
                curVal = nums2[n2]
                n2 += 1
            }
        }
        if cnt % 2 == 0 {
            return Double(lastVal + curVal) / 2
        }
        return Double(curVal)
    }
}
// @lc code=end

