//
//  811.-子域名访问计数.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution811 {
    func subdomainVisits(_ cpdomains: [String]) -> [String] {
        var res = [String: Int]()
        for cp in cpdomains {
            let splits = cp.split(separator: " ")
            if splits.count == 2 {
                let count = Int(splits[0])!
                let subDoMiains = splits[1].split(separator: ".")
                var lastDomain = ""
                for l in subDoMiains.reversed() {
                    if lastDomain.count > 0 {
                        lastDomain = String(l) + "." + lastDomain 
                    } else {
                        lastDomain = String(l)
                    }
                    
                    res[lastDomain, default: 0] += count
                }
            }
        }
        var result = [String]()
        for (k, v) in res {
            result.append("\(v) \(k)")
        }
        return result
    }
}
