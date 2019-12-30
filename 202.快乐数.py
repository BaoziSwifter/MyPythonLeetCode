#
# @lc app=leetcode.cn id=202 lang=python
#
# [202] 快乐数
#
# https://leetcode-cn.com/problems/happy-number/description/
#
# algorithms
# Easy (55.84%)
# Likes:    204
# Dislikes: 0
# Total Accepted:    39.1K
# Total Submissions: 69.4K
# Testcase Example:  '19'
#
# 编写一个算法来判断一个数是不是“快乐数”。
# 
# 一个“快乐数”定义为：对于一个正整数，每一次将该数替换为它每个位置上的数字的平方和，然后重复这个过程直到这个数变为 1，也可能是无限循环但始终变不到
# 1。如果可以变为 1，那么这个数就是快乐数。
# 
# 示例: 
# 
# 输入: 19
# 输出: true
# 解释: 
# 1^2 + 9^2 = 82
# 8^2 + 2^2 = 68
# 6^2 + 8^2 = 100
# 1^2 + 0^2 + 0^2 = 1
# 
# 
#

# @lc code=start
class Solution(object):
    # 使用“快慢指针”思想找出循环：“快指针”每次走两步，“慢指针”每次走一步，当二者相等时，即为一个循环周期。此时，判断是不是因为1引起的循环，是的话就是快乐数，否则不是快乐数。
# 401/401 cases passed (8 ms)
# Your runtime beats 100 % of python submissions
# Your memory usage beats 25.16 % of python submissions (11.7 MB)
    def isHappy1(self, n):
        """
        :type n: int
        :rtype: bool
        """
        def bitSum(n):
            sum = 0
            while n:
                bit  = n % 10
                sum += bit * bit
                n = n / 10
            return sum

        slow = n 
        fast = n

        while True:
        
            slow = bitSum(slow)
            fast = bitSum(fast)
            fast = bitSum(fast)
            if fast == slow:
                break

        return fast == 1
# 401/401 cases passed (16 ms)
# Your runtime beats 95.02 % of python submissions
# Your memory usage beats 34.27 % of python submissions (11.6 MB)
    def isHappy(self, n):
        return self.isHappy(sum(int(i) ** 2 for i in str(n))) if n > 4 else n == 1       
# @lc code=end

