#
# @lc app=leetcode.cn id=64 lang=python
#
# [64] 最小路径和
#
# https://leetcode-cn.com/problems/minimum-path-sum/description/
#
# algorithms
# Medium (62.85%)
# Likes:    340
# Dislikes: 0
# Total Accepted:    46.3K
# Total Submissions: 73.1K
# Testcase Example:  '[[1,3,1],[1,5,1],[4,2,1]]'
#
# 给定一个包含非负整数的 m x n 网格，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。
# 
# 说明：每次只能向下或者向右移动一步。
# 
# 示例:
# 
# 输入:
# [
# [1,3,1],
# ⁠ [1,5,1],
# ⁠ [4,2,1]
# ]
# 输出: 7
# 解释: 因为路径 1→3→1→1→1 的总和最小。
# 
# 
#


# 61/61 cases passed (88 ms)
# Your runtime beats 76.72 % of python submissions
# Your memory usage beats 35.49 % of python submissions (12.9 MB)
class Solution1(object):
    def minPathSum(self, grid):
        m = len(grid)
        n = len(grid[0])
        dp = [[0 for col in range(n)] for row in range(m)]
        for i in range(m-1,-1,-1):
            for j in range(n-1,-1,-1):
                if j == n-1 and i != m-1:
                    dp[i][j] = grid[i][j] + dp[i+1][j]
                elif j!= n-1 and i == m-1:
                    dp[i][j] = grid[i][j] + dp[i][j+1]
                elif j!= n-1 and i != m-1:
                    dp[i][j] = grid[i][j] + min(dp[i][j+1],dp[i+1][j])
                else:
                    dp[i][j] = grid[i][j]
        
        return dp[0][0]
# @lc code=start
# 61/61 cases passed (84 ms)
# Your runtime beats 89.8 % of python submissions
# Your memory usage beats 47.04 % of python submissions (12.7 MB)
class Solution2(object):
    def minPathSum(self, grid):
        rows = len(grid)
        cols = len(grid[0])
        for row in range(rows-1,-1,-1):
            for col in range(cols-1,-1,-1):
                if row == rows - 1 and col < cols-1:
                    grid[row][col] += grid[row][col + 1] 
                elif col == cols - 1 and row < rows-1:
                    grid[row][col] += grid[row+1][col] 
                elif col < cols - 1 and row < rows -1:
                    grid[row][col] += min(grid[row][col+1],grid[row+1][col])

        return grid[0][0]  

class Solution(object):
    def minPathSum(self, grid):
        m = len(grid)
        n = len(grid[0])
        
        #第0行
        for j in range(1, n):
            grid[0][j] = grid[0][j-1] + grid[0][j]
            
        #第0列
        for i in range(1, m):
            grid[i][0] = grid[i-1][0] + grid[i][0]
        
        for i in range(1, m):
            for j in range(1, n):
                grid[i][j] += min(grid[i-1][j], grid[i][j-1])
        
        return grid[-1][-1]
# @lc code=end

