#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/2/20 14:25
# @Author  : Beliefei
# @File    : 22-两数相加.py
# @Software: PyCharm

"""
给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。

如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。

您可以假设除了数字 0 之外，这两个数都不会以 0 开头。

示例：

输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
输出：7 -> 0 -> 8
原因：342 + 465 = 807
"""

# Definition for singly-linked list.
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution:
    def addTwoNumbers(self, l1, l2):
        """
        :type l1: ListNode
        :type l2: ListNode
        :rtype: ListNode
        """
        """
                re = ListNode(0)
        r=re
        carry=0
        while(l1 or l2):
            x= l1.val if l1 else 0
            y= l2.val if l2 else 0
            s=carry+x+y
            carry=s//10
            r.next=ListNode(s%10)
            r=r.next
            if(l1!=None):l1=l1.next
            if(l2!=None):l2=l2.next
        if(carry>0):
            r.next=ListNode(1)
        return re.next
        """
        if l1 is None and l2 is None:
            return None
        head = ListNode()
        tmp = head
        lastVal = 0
        first = l1
        second = l2
        while first or second or lastVal > 0:
            sumVal = lastVal
            if first is not None:
                sumVal = sumVal + first.val
                first = first.next
            if second is not None:
                sumVal = sumVal + second.val
                second = second.next
            lastVal = sumVal // 10
            c = ListNode(sumVal % 10)
            tmp.next = c
            tmp = c
        return head.next



