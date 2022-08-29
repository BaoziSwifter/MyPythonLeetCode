//
//  179.最大数.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/29.
//

import Foundation


class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        let res = nums.sorted { a, b in
            let l = String(a)
            let r = String(b)
            return l + r > r + l
        }
        if res.first == .zero { return "0" }
        return res.reduce("") {
            $0 + String($1)
        }
    }
}
