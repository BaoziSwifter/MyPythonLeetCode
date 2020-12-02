#
# @lc app=leetcode.cn id=242 lang=python
#
# [242] 有效的字母异位词
#
# https://leetcode-cn.com/problems/valid-anagram/description/
#
# algorithms
# Easy (56.75%)
# Likes:    142
# Dislikes: 0
# Total Accepted:    64.6K
# Total Submissions: 112.2K
# Testcase Example:  '"anagram"\n"nagaram"'
#
# 给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。
# 
# 示例 1:
# 
# 输入: s = "anagram", t = "nagaram"
# 输出: true
# 
# 
# 示例 2:
# 
# 输入: s = "rat", t = "car"
# 输出: false
# 
# 说明:
# 你可以假设字符串只包含小写字母。
# 
# 进阶:
# 如果输入字符串包含 unicode 字符怎么办？你能否调整你的解法来应对这种情况？
# 
#

# @lc code=start
# 34/34 cases passed (48 ms)
# Your runtime beats 54.53 % of python submissions
# Your memory usage beats 41.44 % of python submissions (12.6 MB)
class Solution(object):
    def isAnagram(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: bool
        """
        sDict = {}
        tDict = {}
        for sItem in s:
            sDict[sItem] = sDict.get(sItem,0) + 1
        for sItem in t:
            tDict[sItem] = tDict.get(sItem,0) + 1
            
        return sDict == tDict

        
# @lc code=end

