//
//  394.-字符串解码.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation

class Solution394 {
    func decodeString(_ s: String) -> String {
        var stack = [(Int, String)]()
        var res = ""
        var muti = 0
        for c in s {
            if c == "[" {
                stack.append((muti, res))
                muti = 0
                res = ""
            } else if c == "]" {
                if let (cMuti, lastRes) = stack.popLast() {
                    res = lastRes + String(repeating: res, count: cMuti)
                }
            } else if c.isWholeNumber {
                muti = muti * 10 + c.wholeNumberValue!
            } else {
                res.append(c)
            }
        }
        return res
    }
}
