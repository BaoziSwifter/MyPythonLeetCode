#
# @lc app=leetcode.cn id=22 lang=python
#
# [22] 括号生成
#
# https://leetcode-cn.com/problems/generate-parentheses/description/
#
# algorithms
# Medium (72.39%)
# Likes:    606
# Dislikes: 0
# Total Accepted:    52.8K
# Total Submissions: 72.9K
# Testcase Example:  '3'
#
# 给出 n 代表生成括号的对数，请你写出一个函数，使其能够生成所有可能的并且有效的括号组合。
# 
# 例如，给出 n = 3，生成结果为：
# 
# [
# ⁠ "((()))",
# ⁠ "(()())",
# ⁠ "(())()",
# ⁠ "()(())",
# ⁠ "()()()"
# ]
# 
# 
#

# @lc code=start

# 1. 结果正确  但是在leetcode超时
class Solution1(object):
    
    def generateParenthesis(self, n):
    #     """
    #     :type n: int
    #     :rtype: List[str]
    #     """
    
        data = "()"*n
        res = set()

        def trackback(leftData,resData):
            if not leftData:
                if checkStr(resData):
                    res.add(resData)
            else:
                l = len(leftData)
                for i in range(l):
                    trackback(leftData[:i]+leftData[i+1:],resData+leftData[i])
        
        def checkStr(resStr):
            leftCount = 0
            for i in range(len(resStr)):
                if resStr[i] == '(': leftCount += 1
                else: leftCount -= 1
                if leftCount < 0:
                    return False
            return leftCount == 0
        
        trackback(data,'')
        return list(res)

    # 暴力法
class Solution2(object):
    def generateParenthesis(self, n):
        def generate(A = []):
            if len(A) == 2*n:
                if checkStr(A):
                    res.append("".join(A))
            else:
                A.append('(')
                generate(A)
                A.pop()

                A.append(')')
                generate(A)
                A.pop()
        
        def checkStr(resStr):
            leftCount = 0
            for i in resStr:
                if i == '(': leftCount += 1
                else: leftCount -= 1
                if leftCount < 0: return False
            return leftCount == 0
  
        res = []
        generate()
        return res

# 只有在我们知道序列仍然保持有效时才添加 '(' or ')'，
# 可以通过跟踪到目前为止放置的左括号和右括号的数目来做到这一点，
# 如果我们还剩一个位置，我们可以开始放一个左括号。
#  如果它不超过左括号的数量，我们可以放一个右括号。

# Your runtime beats 59.05 % of python submissions
# Your memory usage beats 30.96 % of python submissions (12 MB)
class Solution3(object):
    def generateParenthesis(self, n):
        res = []

        def trackBack(s = '',left = 0, right = 0):
            if len(s) ==  2*n:
                res.append(s)
            else:
                if left < n:
                    trackBack(s+'(',left+1,right)
                if left > right:
                    trackBack(s+')',left,right+1)
        trackBack()
        return res

# 动态规划

# 8/8 cases passed (32 ms)
# Your runtime beats 41.22 % of python submissions
# Your memory usage beats 20.96 % of python submissions (12 MB)

# 思想 "("+[i=p时 所有的排列组合]+")"+[j=n-p-1时 所有的括号排列组合] i + j = n-1 且 i j 非负整数 
class Solution4(object):
    def generateParenthesis(self,n):
        res = [[] for _ in range(n+1)]
        res[0] = [""]

        for i in range(1,n+1):
            for j in range(i):
                l = res[j]
                r = res[i-1-j]
                for li in l:
                    for ri in r:
                        res[i].append("({0}){1}".format(li,ri))
        
        return res[n]


# 8/8 cases passed (20 ms)
# Your runtime beats 91.59 % of python submissions
# Your memory usage beats 35.39 % of python submissions (11.9 MB)
class Solution(object):
    def generateParenthesis(self, n):
        if n == 0:
            return []
        total_l = []
        total_l.append([None])    # 0组括号时记为None
        total_l.append(["()"])    # 1组括号只有一种情况
        for i in range(2,n+1):    # 开始计算i组括号时的括号组合
            l = []        
            for j in range(i):    # 开始遍历 p q ，其中p+q=i-1 , j 作为索引
                now_list1 = total_l[j]    # p = j 时的括号组合情况
                now_list2 = total_l[i-1-j]    # q = (i-1) - j 时的括号组合情况
                for k1 in now_list1:  
                    for k2 in now_list2:
                        if k1 == None:
                            k1 = ""
                        if k2 == None:
                            k2 = ""
                        el = "(" + k1 + ")" + k2
                        l.append(el)    # 把所有可能的情况添加到 l 中
            total_l.append(l)    # l这个list就是i组括号的所有情况，添加到total_l中，继续求解i=i+1的情况
        return total_l[n]

       
# @lc code=end

