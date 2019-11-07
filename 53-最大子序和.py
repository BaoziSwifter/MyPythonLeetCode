#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/2/20 17:26
# @Author  : Beliefei
# @File    : 53-最大子序列.py
# @Software: PyCharm

"""
给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

示例:

输入: [-2,1,-3,4,-1,2,1,-5,4],
输出: 6
解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
进阶:

如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的分治法求解。
"""

class Solution:
    def maxSubArray(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        sumVal = 0
        if nums is None:
            return 0
        max_sub = nums[0]
        for item in nums:
            sumVal += item
            if sumVal > max_sub:
                max_sub = sumVal
            if sumVal < 0 :
                sumVal = 0
        return max_sub


if __name__ == "__main__":
    s = Solution()
    print("max value is %d" % s.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
