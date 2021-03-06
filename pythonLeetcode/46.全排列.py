#
# @lc app=leetcode.cn id=46 lang=python
#
# [46] 全排列
#
# https://leetcode-cn.com/problems/permutations/description/
#
# algorithms
# Medium (72.55%)
# Likes:    439
# Dislikes: 0
# Total Accepted:    56.8K
# Total Submissions: 78.3K
# Testcase Example:  '[1,2,3]'
#
# 给定一个没有重复数字的序列，返回其所有可能的全排列。
# 
# 示例:
# 
# 输入: [1,2,3]
# 输出:
# [
# ⁠ [1,2,3],
# ⁠ [1,3,2],
# ⁠ [2,1,3],
# ⁠ [2,3,1],
# ⁠ [3,1,2],
# ⁠ [3,2,1]
# ]
# 
#

# @lc code=start
class Solution(object):

    def permute(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """      
        # l = len(nums)
        # if l == 1:
        #     return [nums]
        # if l == 0:
        #     return []
        # res = []
        # for i in range(l):
        #     for j in self.permute(nums[:i]+nums[i+1:]):
        #         res.append([nums[i]]+j)
        # return res

    def permute(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """ 
        res = [] 
        def combin(nums,tmp):
            if not nums:
                res.append(tmp)
            for i in range(len(nums)):
                combin(nums[:i]+nums[i+1:],tmp+[nums[i]])
        combin(nums,[])
        return res       
        
# @lc code=end

