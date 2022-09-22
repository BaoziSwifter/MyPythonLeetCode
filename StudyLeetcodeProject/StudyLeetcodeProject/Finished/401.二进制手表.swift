//
//  401.-二进制手表.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution401 {
    func readBinaryWatch(_ turnedOn: Int) -> [String] {
        var res = [String]()
        for h in 0..<12 {
            for m in 0..<60 {
                if h.nonzeroBitCount + m.nonzeroBitCount == turnedOn {
                    res.append("\(h)" + ":" + (m < 10 ? "0":"") + "\(m)")
                }
            }
        }
        return res
    }

}
