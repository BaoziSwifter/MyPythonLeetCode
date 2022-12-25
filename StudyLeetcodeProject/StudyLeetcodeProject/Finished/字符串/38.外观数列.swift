//
//  38.-外观数列.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution38 {
    func countAndSay(_ n: Int) -> String {
        if n < 1 { return "" }
        var last = "1"
        var val: Character?
        var cnt = 0
        
        for _ in 1..<n {
            var tmp = ""
            for c in last {
                if let v = val {
                    if c == v {
                        cnt += 1
                    } else {
                        tmp = tmp + "\(cnt)"
                        tmp.append(v)
                        cnt = 1
                        val = c
                    }
                } else {
                    val = c
                    cnt += 1
                }
            }
            tmp = tmp + "\(cnt)"
            tmp.append(val!)
            cnt = 0
            val = nil
            last = tmp
        }
        return last
    }
}
