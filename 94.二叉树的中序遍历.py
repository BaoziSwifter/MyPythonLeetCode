#
# @lc app=leetcode.cn id=94 lang=python
#
# [94] 二叉树的中序遍历
#
# https://leetcode-cn.com/problems/binary-tree-inorder-traversal/description/
#
# algorithms
# Medium (68.81%)
# Likes:    315
# Dislikes: 0
# Total Accepted:    75.2K
# Total Submissions: 109.2K
# Testcase Example:  '[1,null,2,3]'
#
# 给定一个二叉树，返回它的中序 遍历。
# 
# 示例:
# 
# 输入: [1,null,2,3]
# ⁠  1
# ⁠   \
# ⁠    2
# ⁠   /
# ⁠  3
# 
# 输出: [1,3,2]
# 
# 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
# 
#

# @lc code=start
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

# 递归
# 68/68 cases passed (16 ms)
# Your runtime beats 74.1 % of python submissions
# Your memory usage beats 5.53 % of python submissions (12 MB)
class Solution1(object):
    def inorderTraversal(self, root):
        """
        :type root: TreeNode
        :rtype: List[int]
        """
        def traversal(root=None):
            if root == None:
                return
            traversal(root.left)
            res.append(root.val)
            traversal(root.right)


        res = []
        traversal(root)
        return res


# 基于栈原理 
# 68/68 cases passed (16 ms)
# Your runtime beats 91.06 % of python submissions
# Your memory usage beats 28.3 % of python submissions (11.7 MB)
class Solution2(object):
    def inorderTraversal(self, root):
        if root == None:
            return None
        res = []
        myStack = []
        while root or len(myStack):
            while root:
                myStack.append(root)
                root = root.left
            root = myStack.pop()
            res.append(root.val)
            root = root.right
        
        return res

# 线索二叉树 莫里斯遍历
# 68/68 cases passed (8 ms)
# Your runtime beats 99.77 % of python submissions
# Your memory usage beats 21.51 % of python submissions (11.8 MB)
class Solution(object):
    def inorderTraversal(self, root):
        res= []
        left = None
        while root:
            if root.left == None:
                res.append(root.val)
                root = root.right
            else:
                left = root.left
                while left.right:
                    left = left.right 
                left.right = root
                tmp = root
                root = root.left
                tmp.left = None



        return res
# @lc code=end

