#
# @lc app=leetcode.cn id=39 lang=python
#
# [39] 组合总和
#
# https://leetcode-cn.com/problems/combination-sum/description/
#
# algorithms 
# Medium (67.32%)
# Likes:    434
# Dislikes: 0
# Total Accepted:    44.5K
# Total Submissions: 66.1K
# Testcase Example:  '[2,3,6,7]\n7'
#
# 给定一个无重复元素的数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。
# 
# candidates 中的数字可以无限制重复被选取。
# 
# 说明：
# 
# 
# 所有数字（包括 target）都是正整数。
# 解集不能包含重复的组合。 
# 
# 
# 示例 1:
# 
# 输入: candidates = [2,3,6,7], target = 7,
# 所求解集为:
# [
# ⁠ [7],
# ⁠ [2,2,3]
# ]
# 
# 
# 示例 2:
# 
# 输入: candidates = [2,3,5], target = 8,
# 所求解集为:
# [
# [2,2,2,2],
# [2,3,3],
# [3,5]
# ]
# 
#

# @lc code=start
# 168/168 cases passed (36 ms)
# Your runtime beats 98.06 % of python submissions
# Your memory usage beats 28.68 % of python submissions (11.8 MB)
class Solution(object):
    def combinationSum(self, candidates, target):
        """
        :type candidates: List[int]
        :type target: int
        :rtype: List[List[int]]
        """
        if candidates == None:
            return []
        candidates.sort()
        n = len(candidates)
        result = []
        def findResult(i,target,temp):
            if target == 0 and temp:
                result.append(temp)
            else:
                if i == n or target < candidates[i]:
                    return
                findResult(i,target-candidates[i],temp+[candidates[i]])
                findResult(i+1,target,temp)
        findResult(0,target,[])
        return result           
        
# @lc code=end

