//
//  151.-颠倒字符串中的单词.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution151 {
    func reverseWords(_ s: String) -> String {
        let s = s.trimmingCharacters(in: CharacterSet.whitespaces)
        let splitRes = s.split(separator: " ")
        var res = [String]()
        var end = splitRes.count - 1
        while end >= 0 {
            if splitRes[end] != "" {
                res.append(String(splitRes[end]))
            }
            end -= 1
        }
        return res.joined(separator: " ")
    }
}

