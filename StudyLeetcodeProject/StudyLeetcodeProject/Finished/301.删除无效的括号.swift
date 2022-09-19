//
//  301.-删除无效的括号.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation


class Solution301 {
    func removeInvalidParentheses(_ s: String) -> [String] {
        var res = [String]()
        var visited = Set<String>()
        
        func isVaild(_ s:String) -> Bool {
            var count = 0
            let strArray = [Character](s)
            for i in 0 ..< s.count {
                if strArray[i] == "(" {
                    count += 1
                } else if strArray[i] == ")" {
                    count -= 1
                }
                
                if count < 0 {
                    return false
                }
            }
            return count == 0
        }
        
        func removeInvalidParentheseDFS(_ s: String, _ start: Int, _ l: Int, _ r: Int) {
            if l == 0, r == 0 {
                if isVaild(s) {
                    res.append(s)
                }
                return
            }
            for i in start..<s.count {
                if l > 0, s[s.index(s.startIndex, offsetBy: i)] == "(" {
                    var s = s
                    s.remove(at: s.index(s.startIndex, offsetBy: i))
                    if !visited.contains(s) {
                        visited.insert(s)
                        removeInvalidParentheseDFS(s, i, l - 1, r)
                    }
                }
                
                if r > 0, s[s.index(s.startIndex, offsetBy: i)] == ")" {
                    var s = s
                    s.remove(at: s.index(s.startIndex, offsetBy: i))
                    if !visited.contains(s) {
                        visited.insert(s)
                        removeInvalidParentheseDFS(s, i, l, r - 1)
                    }
                }
            }
        }
        
        var left = 0, right = 0
        for ch in s {
            if ch == "(" {
                left += 1
            } else if ch == ")" {
                if left == 0 {
                    right += 1
                } else {
                    left -= 1
                }
            }
        }
        removeInvalidParentheseDFS(s, 0, left, right)
        return res
    }
    
    func removeInvalidParentheses_3(_ s: String) -> [String] {
        func isValid(_ s: String) -> Bool {
            var count = 0
            for c in s {
                if c == "(" {
                    count += 1
                } else if c == ")" {
                    count -= 1
                }
                
                if count < 0 {
                    return false
                }
            }
            return count == 0
        }
        
        var res = [String]()
        var queue = [String]()
        
        queue.append(s)
        var visited = Set<String>()
        visited.insert(s)
        var found = false
        
        while !queue.isEmpty {
            let str = queue.removeFirst()
            if isValid(str) {
                res.append(str)
                found = true
            }
            if found {
                continue
            }
            
            for i in 0..<str.count {
                let val = str[str.index(str.startIndex, offsetBy: i)]
                if val != "(", val != ")" {
                    continue
                }
                let startIndex = str.index(str.startIndex, offsetBy: i)
                let endIndex = str.index(str.startIndex, offsetBy: i+1)
                let newStr = str.replacingCharacters(in: startIndex..<endIndex, with: "")
                if !visited.contains(newStr) {
                    queue.append(newStr)
                    visited.insert(newStr)
                }
            }
        }
        return res
    }
}
