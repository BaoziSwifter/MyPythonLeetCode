#
# @lc app=leetcode.cn id=48 lang=python
#
# [48] 旋转图像
#
# https://leetcode-cn.com/problems/rotate-image/description/
#
# algorithms
# Medium (65.32%)
# Likes:    312
# Dislikes: 0
# Total Accepted:    43.4K
# Total Submissions: 66.3K
# Testcase Example:  '[[1,2,3],[4,5,6],[7,8,9]]'
#
# 给定一个 n × n 的二维矩阵表示一个图像。
# 
# 将图像顺时针旋转 90 度。
# 
# 说明：
# 
# 你必须在原地旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要使用另一个矩阵来旋转图像。
# 
# 示例 1:
# 
# 给定 matrix = 
# [
# ⁠ [1,2,3],
# ⁠ [4,5,6],
# ⁠ [7,8,9]
# ],
# 
# 原地旋转输入矩阵，使其变为:
# [
# ⁠ [7,4,1],
# ⁠ [8,5,2],
# ⁠ [9,6,3]
# ]
# 
# 
# 示例 2:
# 
# 给定 matrix =
# [
# ⁠ [ 5, 1, 9,11],
# ⁠ [ 2, 4, 8,10],
# ⁠ [13, 3, 6, 7],
# ⁠ [15,14,12,16]
# ], 
# 
# 原地旋转输入矩阵，使其变为:
# [
# ⁠ [15,13, 2, 5],
# ⁠ [14, 3, 4, 1],
# ⁠ [12, 6, 8, 9],
# ⁠ [16, 7,10,11]
# ]
# 
# 
#

# @lc code=start
class Solution(object):
    def rotate1(self, matrix):
        N = len(matrix)
        for i in range(N//2):
            for j in range(i,N-i-1):
                tmp1 = matrix[i][j]
                for k in range(4):
                    i_new, j_new = j, N-i-1
                    tmp2 = matrix[i_new][j_new]
                    matrix[i_new][j_new] = tmp1
                    tmp1 = tmp2
                    i, j = i_new, j_new
    def rotate2(self, matrix):
        """
        :type matrix: List[List[int]]
        :rtype: None Do not return anything, modify matrix in-place instead.
        """
        n = len(matrix) 
        for i in range(n//2):
            for j in range(i, n - i - 1):
                matrix[i][j],matrix[j][n-i-1],matrix[n-i-1][n-j-1],matrix[n-j-1][i] = \
                matrix[n-j-1][i], matrix[i][j],matrix[j][n-i-1],matrix[n-i-1][n-j-1]
        #print(matrix)
    # 21/21 cases passed (20 ms)
    # Your runtime beats 93.45 % of python submissions
    # Your memory usage beats 33.25 % of python submissions (11.7 MB)
    def rotate(self, a):
        """
        :type matrix: List[List[int]]
        :rtype: None Do not return anything, modify matrix in-place instead.
        """
    
        n = len(a[0])        
        # for i in range(n // 2 + n % 2):
        #     for j in range(n // 2):
        #         tmp = a[n - 1 - j][i]
        #         a[n - 1 - j][i] = a[n - 1 - i][n - j - 1]
        #         a[n - 1 - i][n - j - 1] = a[j][n - 1 -i]
        #         a[j][n - 1 - i] = a[i][j]
        #         a[i][j] = tmp

        for i in range(n//2 + n%2):
            for j in range(n//2):
                a[i][j],a[j][n-i-1],a[n-i-1][n-j-1],a[n-j-1][i] = a[n-j-1][i],a[i][j],a[j][n-i-1],a[n-i-1][n-j-1]


# @lc code=end

