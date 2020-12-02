"""
给定一个非负整数 numRows，生成杨辉三角的前 numRows 行。

在杨辉三角中，每个数是它左上方和右上方的数的和。

示例:

输入: 5
输出:
[
     [1],
    [1,1],
   [1,2,1],
  [1,3,3,1],
 [1,4,6,4,1]
]
"""

class Solution:
    def generate(self, numRows):
        """
        :type numRows: int
        :rtype: List[List[int]]
        """

        """
        res = [[1]]
        for i in range(1,numRows):
            res.append(list(map(lambda x, y : x + y, res[-1]+[0], [0]+res[-1])))
        return res[:numRows]
        """
        p = [1]
        if not numRows:
            return [p]
        c = []
        c.append(p)
        for j in range(numRows):
            p = [1] + [p[i]+p[i+1] for i in range(len(p)-1)] +[1]
            c.append(p)
        return c

if __name__ == '__main__':
    s = Solution()
    print(s.generate(5))
