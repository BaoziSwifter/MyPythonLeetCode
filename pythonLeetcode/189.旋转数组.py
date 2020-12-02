#
# @lc app=leetcode.cn id=189 lang=python
#
# [189] 旋转数组
#
# https://leetcode-cn.com/problems/rotate-array/description/
#
# algorithms
# Easy (39.29%)
# Likes:    443
# Dislikes: 0
# Total Accepted:    87.4K
# Total Submissions: 219.2K
# Testcase Example:  '[1,2,3,4,5,6,7]\n3'
#
# 给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。
# 
# 示例 1:
# 
# 输入: [1,2,3,4,5,6,7] 和 k = 3
# 输出: [5,6,7,1,2,3,4]
# 解释:
# 向右旋转 1 步: [7,1,2,3,4,5,6]
# 向右旋转 2 步: [6,7,1,2,3,4,5]
# 向右旋转 3 步: [5,6,7,1,2,3,4]
# 
# 
# 示例 2:
# 
# 输入: [-1,-100,3,99] 和 k = 2
# 输出: [3,99,-1,-100]
# 解释: 
# 向右旋转 1 步: [99,-1,-100,3]
# 向右旋转 2 步: [3,99,-1,-100]
# 
# 说明:
# 
# 
# 尽可能想出更多的解决方案，至少有三种不同的方法可以解决这个问题。
# 要求使用空间复杂度为 O(1) 的 原地 算法。
# 
# 
#

# @lc code=start
class Solution(object):
    def rotate(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: None Do not return anything, modify nums in-place instead.
        """
        # 34/34 cases passed (140 ms)
        # Your runtime beats 16.65 % of python submissions
        # Your memory usage beats 9.1 % of python submissions (12.1 MB)
        # n = len(nums)
        # k %= n 
        # for _ in range(k):
        #     nums.insert(0,nums.pop())
        
        # 34/34 cases passed (44 ms)
        # Your runtime beats 94.48 % of python submissions
        # Your memory usage beats 8.05 % of python submissions (12.2 MB)
        n=len(nums)
        k%=n
        nums[:]=nums[n-k:]+nums[:n-k]
# @lc code=end

