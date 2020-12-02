#
# @lc app=leetcode.cn id=206 lang=python3
#
# [206] 反转链表
#

# @lc code=start
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

# 解包
#   def reverseList(self, head: ListNode) -> ListNode:
#     cur, prev = head, None
#     while cur:
#       cur.next, prev, cur = prev, cur, cur.next
#     return prev

class Solution:
    def reverseList(self, head: ListNode) -> ListNode:
        fakeNode = None
        while head:
            tmp = head.next
            head.next = fakeNode
            fakeNode = head
            head = tmp
        return fakeNode
        
# @lc code=end

