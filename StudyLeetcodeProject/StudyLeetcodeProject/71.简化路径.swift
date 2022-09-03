//
//  71.简化路径.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/3.
//

import Foundation

class Solution71 {
    func simplifyPath(_ path: String) -> String {
        let parts = path.split(separator: "/").compactMap { String($0) }
        var stack = [String]()
        for p in parts {
            if p.isEmpty || p == "." { continue }
            if p == ".." {
                if !stack.isEmpty { let _ = stack.popLast() }
                continue
            }
            stack.append(p)
        }
        return "/"+stack.joined(separator: "/")
    }
}
