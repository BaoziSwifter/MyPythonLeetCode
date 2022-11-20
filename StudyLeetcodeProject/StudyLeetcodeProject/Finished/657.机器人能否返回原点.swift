//
//  657.-机器人能否返回原点.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution657 {
    func judgeCircle(_ moves: String) -> Bool {
        let chs = Array(moves)
        var resH = 0, resV = 0
        let moveMaps:[Character : Int] = ["U": 1, "D": -1, "R": 1, "L": -1]
        for c in chs {
            if c == "U" || c == "D" {
                resV += moveMaps[c]!
            } else {
                resH += moveMaps[c]!
            }
            
        }
        return resV == 0 && resH == 0
    }
}
