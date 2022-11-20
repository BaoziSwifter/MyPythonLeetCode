//
//  771.-宝石与石头.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution771 {
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        let jeSet: Set<Character> = Set(Array(jewels))
        var count = 0
        for c in stones {
            if jeSet.contains(c) {
                count += 1
            }
        }
        return count
    }
}
