#
# @lc app=leetcode.cn id=17 lang=python
#
# [17] 电话号码的字母组合
#
# https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number/description/
#
# algorithms
# Medium (51.41%)
# Likes:    518
# Dislikes: 0
# Total Accepted:    63.9K
# Total Submissions: 123.6K
# Testcase Example:  '"23"'
#
# 给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。
# 
# 给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。
# 
# 
# 
# 示例:
# 
# 输入："23"
# 输出：["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
# 
# 
# 说明:
# 尽管上面的答案是按字典序排列的，但是你可以任意选择答案输出的顺序。
# 
#
class Solution1(object):
    def letterCombinations(self, digits):
        """
        递归
        :param digits:
        :return:
        """
        d = {'2': 'abc', '3': 'def', '4': 'ghi', '5': 'jkl',
             '6': 'mno', '7': 'pqrs', '8': 'tuv', '9': 'wxyz'}
        if not digits:
            return []
        if len(digits) == 1:
            return [x for x in d[digits[0]]]
        return [x + y for x in d[digits[0]] for y in self.letterCombinations(digits[1:])]
class Solution2(object):
    def letterCombinations(self, digits):
        if not digits:
            return []
        phone = [" ", "*", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
        # 先往队列中加入一个空字符
        res = [""]
        for i in digits:
            letters = phone[ord(i) - 48]
            last_size = len(res)
            for j in range(last_size):
                tmp = res.pop(0)
                for z in letters:
                    res.append(tmp + z)
        return res

# @lc code=start
# 25/25 cases passed (36 ms)
# Your runtime beats 5.62 % of python submissions
# Your memory usage beats 29.76 % of python submissions (11.7 MB)
class Solution(object):
    def letterCombination(self,lastResult,digits,index):
        if len(digits) == index:
            self.res.append(lastResult)
            return
        key = digits[index]
        val = self.numsmap[key]
        for itemVal in val:
            self.letterCombination(lastResult+itemVal,digits,index+1)
        
        return


    def letterCombinations(self, digits):
        self.res = []
        if len(digits):
            self.numsmap = {"1":"","2":"abc","3":"def","4":"ghi","5":"jkl","6":"mno","7":"pqrs","8":"tuv","9":"wxyz","0":" "}
            self.letterCombination("",digits,0)
        return self.res
        
        
        
# @lc code=end

