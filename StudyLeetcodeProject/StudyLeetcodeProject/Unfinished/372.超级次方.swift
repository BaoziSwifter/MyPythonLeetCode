//
//  372.-超级次方.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/13.
//

import Foundation

class Solution372 {
    func superPow(_ a: Int, _ b: [Int]) -> Int {
        let mod = 1337
        var base = a % mod
        var ans = 1, x = base
        b.reversed().forEach { bit in
            ans = ans * qpow(x, bit, mod) % mod
            x = qpow(x, 10, mod) % mod
        }
        return ans
    }
    
    func qpow(_ base: Int, _ exponent: Int, _ mod: Int) -> Int {
        var ans = 1
        var base = base, exponent = exponent
        while exponent > 0 {
            if exponent & 1 == 1 {
                ans = (base * ans) % mod
            }
            base = (base * base) % mod
            exponent >>= 1
        }
        return ans
    }
}
