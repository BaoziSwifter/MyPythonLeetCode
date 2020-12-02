#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
删除排序链表中的重复元素
给定一个排序链表，删除所有重复的元素，使得每个元素只出现一次。

示例 1:

输入: 1->1->2
输出: 1->2
示例 2:

输入: 1->1->2->3->3
输出: 1->2->3

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
"""
class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None
        
class Solution(object):
    def deleteDuplicates(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        p = ListNode('X')
        p.next = head
        d_head = p
        while d_head.next:
            lastNode = d_head.next
            if d_head.val == lastNode.val:
                d_head.next = lastNode.next
            else:
                d_head = d_head.next

        return p.next

def createNodeList(l):
    head = ListNode(0)
    p = head
    for item in l:
        p.next = ListNode(item)
        p = p.next
    
    return head.next


if __name__ == '__main__':
    s = Solution()
    rs = s.deleteDuplicates(createNodeList([1,1,2,3,3,3,5,5]))
    while rs:
        print(">>> %d" % rs.val)
        rs = rs.next