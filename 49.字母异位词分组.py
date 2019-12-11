# coding=utf-8
#
# @lc app=leetcode.cn id=49 lang=python
#
# [49] 字母异位词分组
#
# https://leetcode-cn.com/problems/group-anagrams/description/
#
# algorithms
# Medium (59.21%)
# Likes:    214
# Dislikes: 0
# Total Accepted:    37.2K
# Total Submissions: 62.5K
# Testcase Example:  '["eat","tea","tan","ate","nat","bat"]'
#
# 给定一个字符串数组，将字母异位词组合在一起。字母异位词指字母相同，但排列不同的字符串。
# 
# 示例:
# 
# 输入: ["eat", "tea", "tan", "ate", "nat", "bat"],
# 输出:
# [
# ⁠ ["ate","eat","tea"],
# ⁠ ["nat","tan"],
# ⁠ ["bat"]
# ]
# 
# 说明：
# 
# 
# 所有输入均为小写字母。
# 不考虑答案输出的顺序。
# 
# 
#

# @lc code=start
# 101/101 cases passed (92 ms)
# Your runtime beats 81.26 % of python submissions
# Your memory usage beats 18.48 % of python submissions (16.2 MB)
class Solution(object):
    def groupAnagrams(self, strs):
        """
        :type strs: List[str]
        :rtype: List[List[str]]
        """
        result = {}
        for i in strs:
            key = ''.join(sorted(i))
            cur = result.get(key,[])
            cur.append(i)
            result[key] = cur

        return result.values()
# @lc code=end


if __name__ == "__main__":
    s = Solution()
    s.groupAnagrams(["eat","tea","tan","ate","nat","bat"])
