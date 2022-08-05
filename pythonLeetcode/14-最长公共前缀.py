
#!/usr/bin/env python
# -*- coding: utf-8 -*-
'''
编写一个函数来查找字符串数组中的最长公共前缀。

如果不存在公共前缀，返回空字符串 ""。

示例 1:

输入: ["flower","flow","flight"]
输出: "fl"
示例 2:

输入: ["dog","racecar","car"]
输出: ""
解释: 输入不存在公共前缀。
说明:

所有输入只包含小写字母 a-z 。

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/longest-common-prefix
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

'''
def matchMyStr(s1,s2):
    minLen =  min(len(s1),len(s2))
    index = -1
    if minLen == 0:
        return index
    
    while index < minLen:
        if s2.startswith(s1[0:index+1]):
            index=index+1
        else:
            break
    return index
class Solution(object):
    def longestCommonPrefix(self, strs):
        """
        :type strs: List[str]
        :rtype: str
        """
        if  not strs:
            return ""
        i = -1
        matchStr = strs[0]
        for itemStr in strs:
            i = matchMyStr(matchStr,itemStr)
            if i > -1:
                matchStr = matchStr[0:i]
            else:
                return ""
            
        return matchStr
    

if __name__ == '__main__':
    s = Solution()
    result = s.longestCommonPrefix(['aaa','aaaAAAA',"aacc",'bsss'])
    print(result)
    
'''
28ms leetcode示例

class Solution(object):
    def longestCommonPrefix(self, strs):
        """
        :type strs: List[str]
        :rtype: str
        """
        lcp = ""
        for chars in zip(*strs):
            if len(set(chars)) == 1:
                lcp += chars[0]
            else:
                break
        return lcp
'''


'''
20 毫秒
class Solution(object):
    def longestCommonPrefix(self, strs):
        """
        :type strs: List[str]
        :rtype: str
        """
        if not strs: return ""
        s1 = min(strs)
        s2 = max(strs)
        for i,x in enumerate(s1):
            if x != s2[i]:
                return s2[:i]
        return s1
        '''
    
                
                