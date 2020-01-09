#
# @lc app=leetcode.cn id=217 lang=python
#
# [217] 存在重复元素
#
# https://leetcode-cn.com/problems/contains-duplicate/description/
#
# algorithms
# Easy (50.59%)
# Likes:    197
# Dislikes: 0
# Total Accepted:    98.7K
# Total Submissions: 193.1K
# Testcase Example:  '[1,2,3,1]'
#
# 给定一个整数数组，判断是否存在重复元素。
# 
# 如果任何值在数组中出现至少两次，函数返回 true。如果数组中每个元素都不相同，则返回 false。
# 
# 示例 1:
# 
# 输入: [1,2,3,1]
# 输出: true
# 
# 示例 2:
# 
# 输入: [1,2,3,4]
# 输出: false
# 
# 示例 3:
# 
# 输入: [1,1,1,3,3,4,3,2,4,2]
# 输出: true
# 
#

# @lc code=start
# 18/18 cases passed (152 ms)
# Your runtime beats 16.65 % of python submissions
# Your memory usage beats 30.43 % of python submissions (17.1 MB)
class Solution(object):
    def containsDuplicate(self, nums):
        """
        :type nums: List[int]
        :rtype: bool
        """
        # return len(nums) > len(set(nums))
        storeSet = set()
        for num in nums:
            if num in storeSet:return True
            storeSet.add(num)
        return False
# @lc code=end

