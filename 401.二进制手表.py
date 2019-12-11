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
# 
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
        res = []
        def findResultBy(i,num,maxValue,res,tmp):
            if num == 0:
                res.append(tmp)
                return
            if tmp + 2**i <= maxValue:
                findResultBy(i+1,num-1,maxValue,res,tmp+2**i)
                findResultBy(i+1,num,maxValue,res,tmp)
            else:
                return

        def findResult():
            for i in range(num+1):
                if i < 4 and num - i < 6:
                    H = []
                    M = []
                    findResultBy(0,i,11,H,0)
                    findResultBy(0,num-i,59,M,0)
                    for hi in H:
                        for mi in M:
                            res.append("%d:%02d" % (hi,mi))

        findResult()
        return res


        
# @lc code=end

