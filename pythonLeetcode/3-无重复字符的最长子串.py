#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。

示例 1:

输入: "abcabcbb"
输出: 3 
解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
示例 2:

输入: "bbbbb"
输出: 1
解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
示例 3:

输入: "pwwkew"
输出: 3
解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
     请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
"""

class Solution(object):
    def lengthOfLongestSubstring(self, s):
        findStr = {}
        totalLen = len(s)
        maxLen,left,right = 0,0,0
        while right < totalLen:
            if s[right] in findStr:
                left = max(findStr[s[right]],left)
            maxLen = max(maxLen,right-left+1)
            findStr[s[right]] = right+1
            right += 1
        return maxLen

"""
class Solution(object):
    def lengthOfLongestSubstring(self, s):
        max_x = 0
        d = {}
        start = 0
        for i in range(len(s)):
            if s[i] in d and start <= d[s[i]]:
                start = d[s[i]]+1
            max_x = max(max_x, i-start+1)
            d[s[i]] = i
        return max_x

"""


if __name__ == '__main__':
    s = Solution()
    # res = s.lengthOfLongestSubstring("bbbbbb")
    res = s.lengthOfLongestSubstring("abcdefamjkloiuy")

    print("result---->"+str(res))
    
        

