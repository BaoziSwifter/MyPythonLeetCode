#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。

示例 1：

输入: "babad"
输出: "bab"
注意: "aba" 也是一个有效答案。
示例 2：

输入: "cbbd"
输出: "bb"

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/longest-palindromic-substring
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
'''

class Solution(object):
    def longestPalindrome(self, s):
        """
        :type s: str
        :rtype: str
        """
        currentStr = ""
        i = 0
        strLen = len(s)
        while i < strLen:
            # print(">>>curretn[ "+str(i)+"]"+currentStr)
            if i == 0 :
                if len(currentStr) < 1:
                    currentStr = s[i]
            
            else:
                if s[i] == s[i-1]:
                    subLen = min(i,strLen-i)
                    subCount = 0
                    while subCount < subLen:
                        if s[i-1-subCount] == s[i+subCount]:
                            subCount = subCount+1
                        else:
                            break
                        
                    if len(currentStr) < 2*subCount:
                        currentStr = s[i-subCount:i+subCount]
                
                if i + 1 < strLen and s[i-1] == s[i+1]:
                    subCount = 0
                    subLen = min(i,strLen-i-1)
                    while subCount <  subLen:
                        # print("current count>>>"+str(subCount))
                        if s[i-1-subCount]==s[i+1+subCount]:
                            subCount = subCount + 1
                        else:
                            break
                    endStr = s[i-subCount:i+subCount+1]
                    if len(currentStr) < len(endStr):
                        currentStr = endStr
            i = i + 1
        return currentStr                       
                        
                        
            
            
        
        
        
if __name__ == '__main__':
    s = Solution()
    # result = s.longestPalindrome("abcdedcbe")
    # result = s.longestPalindrome("aa")
    result = s.longestPalindrome("a"*1000)

    print(">>>>>"+result)