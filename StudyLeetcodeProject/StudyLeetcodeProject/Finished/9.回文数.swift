//
//  9.回文数.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution9 {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }else {
            var l = 0;
            var sum = 0
            let o = x
            var x = x
            while x != 0 {
                l = x % 10
                sum = sum * 10 + l
                x = x / 10
            }
            return sum == o
        }
    }
}
