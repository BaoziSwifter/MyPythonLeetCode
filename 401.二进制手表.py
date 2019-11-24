#
# @lc app=leetcode.cn id=401 lang=python
#
# [401] 二进制手表
#
# https://leetcode-cn.com/problems/binary-watch/description/
#
# algorithms
# Easy (50.04%)
# Likes:    84
# Dislikes: 0
# Total Accepted:    7.7K
# Total Submissions: 15.3K
# Testcase Example:  '0'
#
# 二进制手表顶部有 4 个 LED 代表小时（0-11），底部的 6 个 LED 代表分钟（0-59）。
# 
# 每个 LED 代表一个 0 或 1，最低位在右侧。
# 
# 
# 
# 例如，上面的二进制手表读取 “3:25”。
# 
# 给定一个非负整数 n 代表当前 LED 亮着的数量，返回所有可能的时间。
# 
# 案例:
# 
# 
# 输入: n = 1
# 返回: ["1:00", "2:00", "4:00", "8:00", "0:01", "0:02", "0:04", "0:08", "0:16",
# "0:32"]
# 
# 
# 
# 注意事项:
# 
# 
# 输出的顺序没有要求。
# 小时不会以零开头，比如 “01:00” 是不允许的，应为 “1:00”。
# 分钟必须由两位数组成，可能会以零开头，比如 “10:2” 是无效的，应为 “10:02”。
# 
# 401
#

class Solution1(object):
    def readBinaryWatch(self, num):
        """
        :type num: int
        :rtype: List[str]
        """
        return list("%d:%02d"%(i, j) for j in range(60) for i in range(12) if num == bin(i).count('1') + bin(j).count('1'))


# @lc code=start
class Solution(object):
    def readBinaryWatch(self, num):
        kk = [2**i for i in range(7)]

        resA = []

        def findAll(n,maxval,curVal,nextIndex,limtIndex,res):
            if n == 0 :
                if maxval >= curVal:
                    res.append(curVal)
                    return
            else:
                if curVal < maxval and nextIndex <= limtIndex:
                    findAll(n-1,maxval,curVal + kk[nextIndex],nextIndex+1,limtIndex,res)
                    findAll(n,maxval,curVal,nextIndex+1,limtIndex,res)
                        
        def findH(h):
            if h > 3 :
                return []
            else:
                myH = []
                findAll(h,11,0,0,4,myH)
                return myH
                    
        def findM(m):
            if m > 5:
                return []
            else:
                myM = []
                findAll(m,59,0,0,6,myM)
                return myM

        for i in range(num+1):
            resultH = findH(i)
            resultM = findM(num-i)
            for hi in resultH:
                for mi in resultM:
                    resA.append("%d:%02d" % (hi,mi))

        return resA
  
# @lc code=end

