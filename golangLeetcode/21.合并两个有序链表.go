/*
 * @lc app=leetcode.cn id=21 lang=golang
 *
 * [21] 合并两个有序链表
 */

// @lc code=start
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func mergeTwoLists(l1 *ListNode, l2 *ListNode) *ListNode {
	pHead := &ListNode{}
	res := pHead
	for l1 != nil && l2 != nil {
		if l1.Val < l2.Val {
			pHead.Next = l1
			l1 = l1.Next
		} else {
			pHead.Next = l2
			l2 = l2.Next
		}
		pHead = pHead.Next
	}
	if l1 != nil {
		pHead.Next = l1
	}

	if l2 != nil {
		pHead.Next = l2
	}

	return res.Next
}

// @lc code=end

