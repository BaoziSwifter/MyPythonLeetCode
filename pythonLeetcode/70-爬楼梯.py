#!/usr/bin/env python
# -*- coding: utf-8 -*-


"""
假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

注意：给定 n 是一个正整数。

示例 1：

输入： 2
输出： 2
解释： 有两种方法可以爬到楼顶。
1.  1 阶 + 1 阶
2.  2 阶
示例 2：

输入： 3
输出： 3
解释： 有三种方法可以爬到楼顶。
1.  1 阶 + 1 阶 + 1 阶
2.  1 阶 + 2 阶
3.  2 阶 + 1 阶

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/climbing-stairs
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
"""


class Solution(object):
    def climbStairs(self, n):
        """
        :type n: int
        :rtype: int
        """
        if not n: return 0
        if n == 1 or n==2: return n        
        a,b = 1,2
        for i in range(3, n+1):
            a,b= b,a + b
        return b)
    
class Solution1(object):
    cacuDict = {1:1,2:2}
    
    def climbStairs(self, n):
        """
        :type n: int
        :rtype: int
        """
        
        if n == 0:
            return 0
        else:
            
            if n in self.cacuDict.keys():
                return self.cacuDict[n]
            else:
                re = self.climbStairs(n-1)+self.climbStairs(n-2)
                self.cacuDict[n] = re
                return re
            
    
    
if __name__ == '__main__':
    s = Solution1()
    print("3   %d" % s.climbStairs(3))
    print("4   %d" % s.climbStairs(4))
    print("5   %d" % s.climbStairs(5))
    print("6   %d" % s.climbStairs(6))
 
    