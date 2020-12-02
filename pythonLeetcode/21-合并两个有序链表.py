#!/usr/bin/env python
# -*- coding: utf-8 -*-


"""
将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。 

示例：

输入：1->2->4, 1->3->4
输出：1->1->2->3->4->4

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/merge-two-sorted-lists
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
"""

# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None
        

def createNodeList(l):
    head = ListNode(0)
    p = head
    for item in l:
        p.next = ListNode(item)
        p = p.next
    
    return head.next

class Solution(object):
    def mergeTwoLists(self, l1, l2):
        """
        :type l1: ListNode
        :type l2: ListNode
        :rtype: ListNode
        """
        l1_dammy = ListNode(0)
        l1_dammy.next = l1
        head1 = l1_dammy
        
        l2_dammy = ListNode(0)
        l2_dammy.next = l2
        head2 = l2_dammy
        
        while head1.next and head2.next:
            h1 = head1.next
            h2 = head2.next
            if h1.val >= h2.val:
                change2 = h2
                head2.next = h2.next
                change2.next = head1.next
                head1.next = change2
            head1 = head1.next
        if not head1.next and head2.next:
                head1.next = head2.next
 
        res = l1_dammy.next;
        return res
        
            
            
if __name__ == "__main__":
    head1 = createNodeList([1,1,4])
    head2 = createNodeList([2,4,5])
    
    
    s = Solution()
    res = s.mergeTwoLists(head1,head2)
    p = res
    while p:
        print(">>> %d" % p.val)
        p = p.next
            
        
            
        