//
//  49.-字母异位词分组.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution49 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [String: [String]]()
        for s in strs {
            let key = String(s.sorted())
            dict[key, default: []].append(s)
        }
        return Array(dict.values)
    }
}
