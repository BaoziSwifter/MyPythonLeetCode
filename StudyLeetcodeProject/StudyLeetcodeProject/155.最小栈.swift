//
//  155.-最小栈.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class MinStack155 {
    var array = [Int]()
    var minVal: Int?
    init() {

    }
    
    func push(_ val: Int) {
        if val < getMin() {
            minVal = val
        }
        array.append(val)
    }
    
    func pop() {
        let last = array.popLast()
        if last == minVal {
            minVal = nil
        }
    }
    
    func top() -> Int {
        guard let top = array.last else {
            return 0
        }
        return top
    }
    
    func getMin() -> Int {
        if array.isEmpty { return 0 }
        if minVal == nil { findMin() }
        return minVal!
    }
    
    func findMin() {
        minVal = array.reduce(Int.max) { min($0, $1) }
    }
}

class MinStack155_1 {
    var stack = [Int]()
    var minStack = [Int.max]
    init() {

    }
    
    func push(_ val: Int) {
        stack.append(val)
        let cnt = minStack.count
        minStack.append(min(minStack[cnt - 1], val))
    }
    
    func pop() {
        if !stack.isEmpty {
            let _ = stack.popLast()
            let _ = minStack.popLast()
        }
    }
    
    func top() -> Int {
        if stack.isEmpty == false {
            return stack.last!
        }
        return -1
    }
    
    func getMin() -> Int {
        if stack.isEmpty == false {
            return minStack.last!
        }
        return -1
    }
}
