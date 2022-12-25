//
//  242.-有效的字母异位词.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution242 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        var sMap = [Character: Int]()
        for i in s {
            sMap[i, default: 0] += 1
        }
        for i in t {
            sMap[i, default: 0] -= 1
        }
        return sMap.values.min() == 0 && sMap.values.max() == 0
        
    }
}
