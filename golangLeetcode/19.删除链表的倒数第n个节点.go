/*
 * @lc app=leetcode.cn id=19 lang=golang
 *
 * [19] 删除链表的倒数第N个节点
 */

// @lc code=start
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func removeNthFromEnd(head *ListNode, n int) *ListNode {
	// metho 1
	// end := head
	// count := 0
	// for count < n {
	// 	end = end.Next
	// 	count += 1
	// }
	// if end == nil {
	// 	return head.Next
	// }
	// preNode := head
	// delNode := head
	// for {
	// 	if end != nil {
	// 		end = end.Next
	// 		preNode = delNode
	// 		delNode = delNode.Next
	// 	} else {
	// 		break
	// 	}
	// }
	// if preNode == delNode {
	// 	return nil
	// }
	// preNode.Next = delNode.Next
	// delNode.Next = nil
	// return head

	// method 2
	result := &ListNode{}
	result.Next = head
	var p *ListNode
	cur := result
	count := 1
	for head != nil {
		if count >= n {
			p = cur
			cur = cur.Next
		}
		head = head.Next
		count++
	}
	p.Next = p.Next.Next
	return result.Next
}

// @lc code=end

