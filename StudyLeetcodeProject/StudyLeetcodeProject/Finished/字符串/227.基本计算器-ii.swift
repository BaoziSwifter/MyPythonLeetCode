//
//  227.-基本计算器-ii.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation


class Solution227 {
    func calculate(_ s: String) -> Int {
        let array = Array(s)
        var stack = [Int]()
        var preNum = 0
        var preSign: Character = "+"
        
        for i in 0 ..< array.count {
            let ch = array[i]
            
            if ch.isNumber {
                preNum = preNum * 10 + Int(String(ch))!
            }

            
            if (!ch.isNumber && ch != " ")  || i == array.count - 1 {
                if preSign == "+" {
                    stack.append(preNum)
                } else if preSign == "-" {
                    stack.append(-preNum)
                } else if preSign == "*" {
                    stack.append(stack.popLast()!*preNum)
                } else {
                    stack.append(stack.popLast()!/preNum)
                }
                preSign = ch
                preNum = 0
            }
            
        }
        
        var res = 0
        while !stack.isEmpty {
            res += stack.popLast()!
        }
        return res
    }
}
