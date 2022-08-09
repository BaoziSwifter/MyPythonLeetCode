//
//  3.二叉树的遍历算法.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/9.
//

import Foundation

// 前序 递归
func preOrder(root: TreeNode?) -> [Int]? {
    if root == nil {
        return nil
    }
    var res = [Int]()
    res.append(root!.val)
    if let l = preOrder(root: root?.left) {
        res += l
    }
    if let r = preOrder(root: root?.right) {
        res += r
    }
    return res
}
// 前序 非递归
func _preOrder(root: TreeNode?) -> [Int]? {
    if root == nil {
        return nil
    }
    var res = [Int]()
    var queue: [TreeNode] = [root!]
    while !queue.isEmpty {
        let q = queue.popLast()!
        res.append(q.val)
        if q.right != nil {
            queue.append(q.right!)
        }
        if q.left != nil {
            queue.append(q.left!)
        }
    }
    return res
}

// 中序 递归
func inOrder(root: TreeNode?) -> [Int]? {
    if root == nil {
        return nil
    }
    var res = [Int]()
   
    if let l = preOrder(root: root?.left) {
        res += l
    }
    res.append(root!.val)
    if let r = preOrder(root: root?.right) {
        res += r
    }
    return res
}

// 中序 非递归
func _inOrder(root: TreeNode?) -> [Int]? {
    if root == nil {
        return nil
    }
    var r = root
    var stack = [TreeNode]()
    var res = [Int]()
    while r != nil || !stack.isEmpty {
        if r != nil {
            stack.append(r!)
            r = r?.left
        } else {
            let node = stack.popLast()!
            res.append(node.val)
            r = node.right
        }
    }
    return res
}

// 后序
func postOrder(root: TreeNode?) -> [Int]? {
    if root == nil {
        return nil
    }
    var res = [Int]()
    if let l = preOrder(root: root?.left) {
        res += l
    }
    if let r = preOrder(root: root?.right) {
        res += r
    }
    res.append(root!.val)
    return res
}

// 后序
func _postOrder(root: TreeNode?) -> [TreeNode]? {
    if root == nil {
        return nil
    }
    var stack = [root!]
    var queue = [TreeNode]()
    while !stack.isEmpty {
        let q = stack.popLast()!
        queue.append(q)
        if q.right != nil {
            stack.append(q.right!)
        }
        if q.left != nil {
            stack.append(q.left!)
        }
    }
    
    return queue.reversed()
}

// 层序
func levelOrder(root: TreeNode?) -> [Int]? {
    if root == nil {
        return nil
    }
    var res:[Int] = []
    var queue: [TreeNode] = [root!]
    while !queue.isEmpty {
        var list: [TreeNode] = []
        for n in queue {
            res.append(n.val)
            if let l = n.left {
                list.append(l)
            }
            
            if let r = n.right {
                list.append(r)
            }
        }
        queue = list
    }
    return res
}
