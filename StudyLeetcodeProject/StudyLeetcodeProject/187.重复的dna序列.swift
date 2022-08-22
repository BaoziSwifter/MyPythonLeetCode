//
//  187.重复的dna序列.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/22.
//

import Foundation

class Solution187 {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        let ss = Array(s)
        var source = [Int]()
        for c in s {
            switch c {
            case "A":
                source.append(0)
            case "G":
                source.append(1)
            case "C":
                source.append(2)
            case "T":
                source.append(3)
            default:
                let _ = c
            }
        }
        var seen = Set<Int>()
        var res = Set<String>()
        let L = 10
        let R = 4
        let RL = NSDecimalNumber(decimal: pow(Decimal(R), L - 1)).intValue
        var windowHash = 0
        var left = 0, right = 0
        while right < source.count {
            windowHash = R * windowHash + source[right]
            right += 1
            if right - left == 10 {
                if seen.contains(windowHash) {
                    let t = ss[left..<right]
                    res.insert(String(t))
                } else {
                    seen.insert(windowHash)
                }
                windowHash = windowHash - source[left] * RL
                left += 1
            }
        }
        return Array(res)
    }
}
