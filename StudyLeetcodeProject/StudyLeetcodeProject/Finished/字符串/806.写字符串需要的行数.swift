//
//  806.-写字符串需要的行数.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution806 {
    func numberOfLines(_ widths: [Int], _ s: String) -> [Int] {
        var currentWidth = 0
        var row = s.count > 0 ? 1 : 0
        for c in s {
            let cWidth = widths[Int(c.asciiValue! - 97)]
            if currentWidth + cWidth > 100 {
                row += 1
                currentWidth = cWidth
            } else {
                currentWidth += cWidth
            }
        }
        return [row, currentWidth]
    }
}
