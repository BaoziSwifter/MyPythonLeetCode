//
//  232.用栈实现队列.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/3.
//

import Foundation

class MyQueue232 {
    var stackIn = [Int]()
    var stackOut = [Int]()

    init() { }
    
    func push(_ x: Int) {
        stackIn.append(x)
    }
    
    func pop() -> Int {
        if stackOut.isEmpty {
            while !stackIn.isEmpty {
                stackOut.append(stackIn.popLast()!)
            }
        }
        return stackOut.popLast() ?? -1
    }
    
    func peek() -> Int {
        let res = pop()
        if res != -1 {
            stackOut.append(res)
        }
        return res
    }
    
    func empty() -> Bool {
        return stackIn.isEmpty && stackOut.isEmpty
    }
}
