#
# @lc app=leetcode.cn id=387 lang=python
#
# [387] 字符串中的第一个唯一字符
#
# https://leetcode-cn.com/problems/first-unique-character-in-a-string/description/
#
# algorithms
# Easy (41.34%)
# Likes:    165
# Dislikes: 0
# Total Accepted:    54.5K
# Total Submissions: 128.9K
# Testcase Example:  '"leetcode"'
#
# 给定一个字符串，找到它的第一个不重复的字符，并返回它的索引。如果不存在，则返回 -1。
# 
# 案例:
# 
# 
# s = "leetcode"
# 返回 0.
# 
# s = "loveleetcode",
# 返回 2.
# 
# 
# 
# 
# 注意事项：您可以假定该字符串只包含小写字母。
# 
#

# @lc code=start
# 104/104 cases passed (104 ms)
# Your runtime beats 79.34 % of python submissions
# Your memory usage beats 37.14 % of python submissions (12.1 MB)
class Solution(object):
    def firstUniqChar(self, s):
        """
        :type s: str
        :rtype: int
        """
        tmpmap = {i:s.count(i) for i in set(s)}
        for i,c in enumerate(s):
            if tmpmap[c] == 1:
                return i 
        return -1
# @lc code=end

