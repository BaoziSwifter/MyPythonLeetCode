//
//  67.-二进制求和.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution67 {

    func addBinary(_ a: String, _ b: String) -> String {
        let a = Array(a.reversed()), b = Array(b.reversed())
        var s = "", ci = 0
        for i in 0..<max(a.count, b.count) {
            let va = (i<a.count) ? Int(String(a[i]))! : 0,
                vb = (i<b.count) ? Int(String(b[i]))! : 0,
                sum = va+vb+ci
            s += String(sum&1)
            ci = sum>>1
        }
        s += (ci==0) ? "" : "1"

        return String(s.reversed())
    }
 
}
