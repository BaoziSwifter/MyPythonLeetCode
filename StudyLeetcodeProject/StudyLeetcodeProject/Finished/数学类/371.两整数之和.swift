//
//  371.-两整数之和.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution371 {
    func getSum(_ a: Int, _ b: Int) -> Int {
        var a = a, b = b
        while b != 0 {
            let sumNoCarry = a ^ b
            let carry = (a & b) << 1
            a = sumNoCarry
            b = carry
        }
        return a
    }
}

