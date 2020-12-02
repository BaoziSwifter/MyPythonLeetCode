#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
给定一个二叉树，检查它是否是镜像对称的。

例如，二叉树 [1,2,2,3,4,4,3] 是对称的。

    1
   / \
  2   2
 / \ / \
3  4 4  3
但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:

    1
   / \
  2   2
   \   \
   3    3
说明:

如果你可以运用递归和迭代两种方法解决这个问题，会很加分。

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/symmetric-tree
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
"""

class TreeNode(object):
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

def someTreeNode(lTree,rTree):
    if not lTree and rTree:
        return False
    elif lTree and not rTree:
        return False
    elif not lTree and not rTree:
        return True
    sameRoot = lTree.val == rTree.val
    if not sameRoot:
        return False
    lSame = someTreeNode(lTree.left,rTree.right)
    if not lSame:
        return False
    rSame = someTreeNode(lTree.right,rTree.left)
    if not rSame:
        return False
    return True

class Solution(object):
    def isSymmetric(self, root):
        if not root:
            return False
        return someTreeNode(root.left,root.right)
    