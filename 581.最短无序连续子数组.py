#
# @lc app=leetcode.cn id=581 lang=python
#
# [581] 最短无序连续子数组
#
# https://leetcode-cn.com/problems/shortest-unsorted-continuous-subarray/description/
#
# algorithms
# Easy (33.16%)
# Likes:    170
# Dislikes: 0
# Total Accepted:    11.6K
# Total Submissions: 35K
# Testcase Example:  '[2,6,4,8,10,9,15]'
#
# 给定一个整数数组，你需要寻找一个连续的子数组，如果对这个子数组进行升序排序，那么整个数组都会变为升序排序。
# 
# 你找到的子数组应是最短的，请输出它的长度。
# 
# 示例 1:
# 
# 
# 输入: [2, 6, 4, 8, 10, 9, 15]
# 输出: 5
# 解释: 你只需要对 [6, 4, 8, 10, 9] 进行升序排序，那么整个表都会变为升序排序。
# 
# 
# 说明 :
# 
# 
# 输入的数组长度范围在 [1, 10,000]。
# 输入的数组可能包含重复元素 ，所以升序的意思是<=。
# 
# 
#

# @lc code=start
class Solution(object):

    # def findUnsortedSubarray(self, nums):
    #     """
    #     :type nums: List[int]
    #     :rtype: int
    #     """
    #     diff = [i for (i, (a,b)) in enumerate(zip(nums, sorted(nums))) if a!=b]
    #     return len(diff) and max(diff) - min(diff) + 1
    
    def findUnsortedSubarray(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        if not nums:
            return nums
        tmp = nums[:]
        tmp.sort()
        
        left ,right = 0, len(nums)-1
        while tmp[left] == nums[left] and left < right:
            left += 1
        
        while tmp[right] == nums[right] and left < right:
            right -= 1
        if left == right:
            return 0
        return right+1-left
# @lc code=end

