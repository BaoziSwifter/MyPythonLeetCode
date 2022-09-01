//
//  28.-实现-str-str.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution28 {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if haystack.count < needle.count { return -1 }
        if haystack.count > 0 && needle.count == 0 { return 0 }
        let needleCnt = needle.count
        let lastIndex = haystack.count - needleCnt - 1
        var start = 0
        while start <= lastIndex {
            let subRange = haystack.index(haystack.startIndex, offsetBy: start)..<haystack.endIndex
            if haystack[subRange].hasPrefix(needle) {
                return start
            }
            start += 1
        }
        return -1
    }
}
