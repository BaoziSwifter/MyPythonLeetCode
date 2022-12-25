//
//  326.-3-的幂.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution326 {
    func isPowerOfThree(_ n: Int) -> Bool {
        if n == 0 { return false }
        if n == 1 { return true }
        if n % 3 != 0 { return false }
        return isPowerOfThree(n / 3)
    }
    // Swift
    static public func isPowerOfThree1(_ n:Int) -> Bool {
        var n = n
        while n>0 && n%3==0 {
            n = n/3
        }
        return n==1
    }

    
}
