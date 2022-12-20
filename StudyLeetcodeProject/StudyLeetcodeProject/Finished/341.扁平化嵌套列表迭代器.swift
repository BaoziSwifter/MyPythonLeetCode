//
//  341.-扁平化嵌套列表迭代器.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation
/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */

protocol NestedInteger {
    func isInteger() -> Bool
    func getInteger() -> Int
    func setInteger(value: Int)
    func add(elem: NestedInteger)
    func getList() -> [NestedInteger]
}

// 深度优先 初始化的时候就将数据打平
class NestedIterator_DFS {
    var array: [NestedInteger]!
    var index = 0
    init(_ nestedList: [NestedInteger]) {
        array = [NestedInteger]();
        dfs(nestedList)
    }
    
    private func dfs(_ nestedList: [NestedInteger]) {
        for n in nestedList {
            if n.isInteger() {
                array.append(n)
            } else {
                dfs(n.getList())
            }
        }
    }
    
    func next() -> Int {
        let n = array[index].getInteger()
        index += 1
        return n
    }
    
    func hasNext() -> Bool {
        return index < array.count
    }
}

class NestedIterator {
    var stack: [NestedInteger]!
    init(_ nestedList: [NestedInteger]) {
        stack = nestedList.reversed();
    }
    
    func next() -> Int {
        return stack.popLast()!.getInteger()
    }
    
    func hasNext() -> Bool {
        if stack.isEmpty {
            return false
        } else {
            return getPrivateNext()
        }
    }
    
    private func getPrivateNext() -> Bool {
        if stack.isEmpty { return false }
        
        // 取出栈顶
        let node = stack.popLast()!
        if node.isInteger() {
            // 放回栈中
            stack.append(node)
            return true
        }
        // 不是整数的话就是列表
        for n in node.getList().reversed() {
            stack.append(n)
        }
        
        while !stack.isEmpty && !stack.last!.isInteger() && stack.last!.getList().count == 0 {
            stack.removeLast()
        }
        return getPrivateNext()
    }
}



/**
 * Your NestedIterator object will be instantiated and called as such:
 * let obj = NestedIterator(nestedList)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
