//
//  709.-转换成小写字母.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution709 {
    func toLowerCase(_ s: String) -> String {
        var res = [Character]()
        for c in s {
            let v = c.asciiValue!
            if v >= 65 && v <= 90 {
                let char = Character(Unicode.Scalar(v + 32))
                res.append(char)
            } else {
                res.append(c)
            }
        }
        return String(res)
    }
}
