
type BinaryNode struct {
	Val       interface{}
	LeftNode  *BinaryNode
	RightNode *BinaryNode
}

func PreOrderTrave(root *BinaryNode) *BinaryNode {
	if root == nil {
		return nil
	}
	stack := make([]*BinaryNode, 0)
	stack = append(&stack, root)
	res := make([]BinaryNode, 0)
	for len(stack) > 0 {
		l := len(stack)
		node := stack[l-1]
		stack = stack[:l-1]
		res = append(res, node)
		if node.RightNode != nil {
			stack = append(stack, node.RightNode)
		}
		if node.LeftNode != nil {
			stack = append(stack, node.LeftNode)
		}
	}
	return res
}

func postOrderTraverse(root *BinaryNode) []*BinaryNode {
	if root == nil {
		return nil
	}

	stack := make([]*BinaryNode, 0)
	stack = append(stack, root)
	res := make([]*BinaryNode, 0)
	for len(stack) > 0 {
		l := len(stack)
		node := stack[l-1]
		res = append(res, node)

		if node.LeftNode != nil {
			stack = append(stack, node.LeftNode)
		}
		if node.RightNode != nil {
			stack = append(stack, node.RightNode)
		}
	}
	return res.Reverse()
}

func inOrderTraverse(root *BinaryNode) []*BinaryNode {
	if root == nil {
		return nil
	}

	node := root
	stack := make([]*BinaryNode, 0)
	res := make([]*BinaryNode, 0)
	for node != nil || len(stack) > 0 {
		if node != nil {
			stack = append(stack, node)
			node = node.LeftNode
		} else {
			l := len(stack)
			node = stack[l-1]
			res = append(res, node)
			node = node.RightNode
		}
	}
	return res
}

