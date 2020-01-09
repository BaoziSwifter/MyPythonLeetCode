#
# @lc app=leetcode.cn id=125 lang=python
#
# [125] 验证回文串
#
# https://leetcode-cn.com/problems/valid-palindrome/description/
#
# algorithms
# Easy (41.42%)
# Likes:    136
# Dislikes: 0
# Total Accepted:    69.2K
# Total Submissions: 165.3K
# Testcase Example:  '"A man, a plan, a canal: Panama"'
#
# 给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写。
# 
# 说明：本题中，我们将空字符串定义为有效的回文串。
# 
# 示例 1:
# 
# 输入: "A man, a plan, a canal: Panama"
# 输出: true
# 
# 
# 示例 2:
# 
# 输入: "race a car"
# 输出: false
# 
# 
#

# @lc code=start
# 476/476 cases passed (548 ms)
# Your runtime beats 5.04 % of python submissions
# Your memory usage beats 22.8 % of python submissions (13.6 MB)
class Solution(object):
    def isPalindrome(self, s):
        """
        :type s: str
        :rtype: bool
        """
        # tmp= s.lower()
        # dealStr = ''
        # for i in tmp:
        #     if (i >= '0' and i <= '9' ) or (i >=  'a' and i <= 'z'):
        #         dealStr += i 
        
        # l = len(dealStr)
        # return dealStr == dealStr[::-1]
        
        # 476/476 cases passed (20 ms)
        # Your runtime beats 99.43 % of python submissions
        # Your memory usage beats 60 % of python submissions (12.5 MB)
        s=str(s)
        s=str.lower(s)
        flag=True
        low=0
        high=len(s)-1
        while low<high:
            while low<high and not s[low].isalnum():
                low=low+1
            while low<high and not s[high].isalnum():
                high=high-1
            if s[low]!=s[high]:
                return False
            low=low+1
            high=high-1
        return True
        
# @lc code=end

