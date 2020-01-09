#
# @lc app=leetcode.cn id=172 lang=python
#
# [172] 阶乘后的零
#
# https://leetcode-cn.com/problems/factorial-trailing-zeroes/description/
#
# algorithms
# Easy (39.60%)
# Likes:    183
# Dislikes: 0
# Total Accepted:    24.2K
# Total Submissions: 61.4K
# Testcase Example:  '3'
#
# 给定一个整数 n，返回 n! 结果尾数中零的数量。
# 
# 示例 1:
# 
# 输入: 3
# 输出: 0
# 解释: 3! = 6, 尾数中没有零。
# 
# 示例 2:
# 
# 输入: 5
# 输出: 1
# 解释: 5! = 120, 尾数中有 1 个零.
# 
# 说明: 你算法的时间复杂度应为 O(log n) 。
# 
#

# @lc code=start
class Solution(object):
    def trailingZeroes(self, n):
        """
        :type n: int
        :rtype: int
        """
        # 502/502 cases passed (8 ms)
        # Your runtime beats 99.54 % of python submissions
        # Your memory usage beats 8.71 % of python submissions (11.8 MB)
        count = 0
        while n > 0:
            count += n // 5
            n = n // 5
        return count
        
# @lc code=end

