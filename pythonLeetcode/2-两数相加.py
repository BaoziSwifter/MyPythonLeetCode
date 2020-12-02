#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。

如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。

您可以假设除了数字 0 之外，这两个数都不会以 0 开头。

示例：

输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
输出：7 -> 0 -> 8
原因：342 + 465 = 807

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/add-two-numbers
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
'''

# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None
def createNode(ll):
    head = ListNode(0);
    p = head
    for i in ll:
        p.next = ListNode(i)
        p = p.next
    return head.next
class Solution(object):
    def addTwoNumbers(self, l1, l2):
            
        if l1 is None:
            l1 = l2
            l2 = None
            return l1

        lastValue = 0
        head = l1
        p = l1
        while l1 and l2:
            s = lastValue
            s += l1.val 
            s += l2.val
            current = s % 10
            lastValue = s//10
            l1.val = current
            p = l1
            l1 = l1.next
            l2 = l2.next
        print("-"*20)    

        if l1 is None and l2 is not None:
            p.next = l2
            l1 = l2
            p = l1
        while l1 or lastValue:
            s = lastValue
            if l1:
                s += l1.val
                l1.val = s%10
                lastValue = s //10
                p = l1
                l1 = l1.next
            else:
                p.next = ListNode(lastValue)
                lastValue = 0
        return head
            
if __name__ == '__main__':
    s = Solution()
    
    res = s.addTwoNumbers(createNode([1,2,3,2,0,7]) ,createNode([2,3,8,9]))
    
    while res:
        print(">>> "+str(res.val))
        res = res.next       