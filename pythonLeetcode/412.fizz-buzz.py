#
# @lc app=leetcode.cn id=412 lang=python
#
# [412] Fizz Buzz
#
# https://leetcode-cn.com/problems/fizz-buzz/description/
#
# algorithms
# Easy (61.55%)
# Likes:    42
# Dislikes: 0
# Total Accepted:    24.8K
# Total Submissions: 40K
# Testcase Example:  '1'
#
# 写一个程序，输出从 1 到 n 数字的字符串表示。
# 
# 1. 如果 n 是3的倍数，输出“Fizz”；
# 
# 2. 如果 n 是5的倍数，输出“Buzz”；
# 
# 3.如果 n 同时是3和5的倍数，输出 “FizzBuzz”。
# 
# 示例：
# 
# n = 15,
# 
# 返回:
# [
# ⁠   "1",
# ⁠   "2",
# ⁠   "Fizz",
# ⁠   "4",
# ⁠   "Buzz",
# ⁠   "Fizz",
# ⁠   "7",
# ⁠   "8",
# ⁠   "Fizz",
# ⁠   "Buzz",
# ⁠   "11",
# ⁠   "Fizz",
# ⁠   "13",
# ⁠   "14",
# ⁠   "FizzBuzz"
# ]
# 
# 
#

# @lc code=start
# 8/8 cases passed (28 ms)
# Your runtime beats 93.25 % of python submissions
# Your memory usage beats 24.39 % of python submissions (12.7 MB)
class Solution(object):
    def fizzBuzz(self, n):
        """
        :type n: int
        :rtype: List[str]
        """
        res = []
        for i in range(1,n+1):
            ableDiv3 = i % 3 == 0
            ableDiv5 = i % 5 == 0
            if ableDiv3 and ableDiv5:
                res.append("FizzBuzz")
            elif ableDiv3:
                res.append("Fizz")
            elif ableDiv5:
                res.append("Buzz")
            else:
                res.append(str(i))
        return res
        
# @lc code=end

