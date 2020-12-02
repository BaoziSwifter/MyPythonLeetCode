#
# @lc app=leetcode.cn id=784 lang=python
#
# [784] 字母大小写全排列
#
# https://leetcode-cn.com/problems/letter-case-permutation/description/
#
# algorithms
# Easy (60.27%)
# Likes:    108
# Dislikes: 0
# Total Accepted:    9.8K
# Total Submissions: 16.3K
# Testcase Example:  '"a1b2"'
#
# 给定一个字符串S，通过将字符串S中的每个字母转变大小写，我们可以获得一个新的字符串。返回所有可能得到的字符串集合。
# 
# 
# 示例:
# 输入: S = "a1b2"
# 输出: ["a1b2", "a1B2", "A1b2", "A1B2"]
# 
# 输入: S = "3z4"
# 输出: ["3z4", "3Z4"]
# 
# 输入: S = "12345"
# 输出: ["12345"]
# 
# 
# 注意：
# 
# 
# S 的长度不超过12。
# S 仅由数字和字母组成。
# 
# 
#

# @lc code=start

# 63/63 cases passed (44 ms)
# Your runtime beats 90.45 % of python submissions
# Your memory usage beats 17.92 % of python submissions (12.9 MB)
class Solution(object):
    def letterCasePermutation(self, S):
        """
        :type S: str
        :rtype: List[str]
        """
        if S == None or len(S) == 0:
            return None
        else:
            res = [[] for _ in range(len(S))]
            first = S[0]
            if first.isdigit():
                res[0].append(first)
            else:
                lowValue = first.lower()
                res[0].append(lowValue)
                res[0].append(lowValue.upper())
            n = len(S)
            for i in range(1,n):
                cur = S[i]
                lastRes = res[i-1]
                curValues = []
                if cur.isdigit():
                    curValues.append(cur)
                else:
                    cur = cur.lower()
                    curValues.append(cur.lower())
                    curValues.append(cur.upper())
                for c in curValues:
                    for lastItem in lastRes:
                        res[i].append(lastItem+c)
            return res[-1]


# 63/63 cases passed (36 ms)
# Your runtime beats 97.27 % of python submissions
# Your memory usage beats 5.66 % of python submissions (13.8 MB)
class Solution1(object):
    def __init(self):
        self.res = []
    def letterCasePermutation(self, S):
        def resultfunc(last = [''],current = 0):
            if current == len(S):
                self.res = last             
                return
            else:
                cur = S[current]
                curVals = []
                if cur.isdigit():
                    curVals.append(cur)
                else:
                    curVals.append(cur.lower())
                    curVals.append(cur.upper())
                results = []
                for i in curVals:
                    for j in last:
                        results.append(j+i)
                resultfunc(results,current+1)
        resultfunc([''],0)
        return self.res        


        
# @lc code=end

if __name__ == "__main__":
    s = Solution()
    s.letterCasePermutation("a1s")
