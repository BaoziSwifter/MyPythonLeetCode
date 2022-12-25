//
//  319.-灯泡开关.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/13.
//

import Foundation

class Solution319 {
    func bulbSwitch(_ n: Int) -> Int {
        return Int(floor(sqrt(Double(n))))
    }
}
