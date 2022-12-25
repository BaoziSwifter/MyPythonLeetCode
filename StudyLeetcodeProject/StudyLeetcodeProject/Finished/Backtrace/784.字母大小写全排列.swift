//
//  784.-字母大小写全排列.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution784 {
    func letterCasePermutation(_ s: String) -> [String] {
        var chs = Array(s)
        let totalCount = chs.count
        var res = [String]()
        func changeuperValue(_ s1: inout [Character], _ startIndex: Int) {
            if startIndex >= totalCount {
                res.append(String(s1))
            } else {
                if s1[startIndex].isUppercase {
                    
                    s1[startIndex] = Character(s1[startIndex].lowercased())
                    changeuperValue(&s1, startIndex + 1)
                    s1[startIndex] = Character(s1[startIndex].uppercased())
                    changeuperValue(&s1, startIndex + 1)
                } else if s1[startIndex].isLowercase {
                   
                    s1[startIndex] = Character(s1[startIndex].uppercased())
                    changeuperValue(&s1, startIndex + 1)
                    s1[startIndex] = Character(s1[startIndex].lowercased())
                    changeuperValue(&s1, startIndex + 1)
                } else {
                    changeuperValue(&s1, startIndex + 1)
                }
            }
        }
        changeuperValue(&chs, 0)
        return res
    }
}
