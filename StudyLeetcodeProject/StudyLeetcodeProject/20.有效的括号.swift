//
//  20.-有效的括号.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution20 {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        let sChar = Array(s)
        let map: [Character: Character] = [
            "}": "{",
            ")": "(",
            "]": "["
        ]
        for i in sChar {
            if i == "{" || i == "(" || i == "[" {
                stack.append(i)
            } else {
                if stack.count == 0 {
                    return false
                }
                let last = stack.popLast()
                if last != map[i]! {
                    return false
                }
            }
        }
        return stack.count == 0
    }
}
