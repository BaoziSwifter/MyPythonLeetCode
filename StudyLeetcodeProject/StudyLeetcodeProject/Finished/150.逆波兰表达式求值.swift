//
//  150.逆波兰表达式求值.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/3.
//

import Foundation


class Solution150 {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = tokens
        var res = [Int]()
        let operations = ["+", "-", "*", "/"]
        while stack.count > 0 {
            let opt = stack.removeFirst()
            if !operations.contains(opt) {
                res.append(Int(opt)!)
            } else {
                if res.count >= 2 {
                    let val2 = res.removeLast()
                    let val1 = res.removeLast()
                    switch opt {
                    case "+":
                        res.append(val1 + val2)
                    case "-": res.append(val1 - val2)
                    case "*": res.append(val1 * val2)
                    default:
                        res.append(val1 / val2)
                    }
                }
            }
        }
        return res[0]
    }
}
