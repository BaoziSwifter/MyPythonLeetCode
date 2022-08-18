//
//  93.复原-ip-地址.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/18.
//

import Foundation
class Solution93_0 {
    var res = [String]()
    var tmp = [String]()
    var sss = ""
    func checkSingleIPString(_ str: String) -> Bool {
        if str.count > 3 || str.count == 0 { return false }
        if str.count > 1 && str.first == "0" { return false }
        return Int(str)! >= 0 && Int(str)! <= 255
    }
    func back(_ begin: Int, _ tmp: [String]) {
        let len_t = tmp.count
        let len_s = sss.count
        if len_t == 3 {
            let left = len_s - begin
            if left > 3 || left <= 0 {
                return
            } else {
                let b = sss.index(sss.startIndex, offsetBy: begin)
                let e = sss.index(b, offsetBy: left)
                let subStr = String(sss[b..<e])
                if checkSingleIPString(subStr) {
                    var t = tmp
                    t.append(subStr)
                    res.append(t.joined(separator: "."))
                    return
                }
            }
        }
        
        for i in 0 ..< 3 {
            if begin + i >= len_s { break }
            let b = sss.index(sss.startIndex, offsetBy: begin)
            let e = sss.index(b, offsetBy: i)
            let subStr = String(sss[b...e])
            if checkSingleIPString(subStr) {
                var t = tmp
                t.append(subStr)
                back(begin + i + 1, t)
            }
        }
        
    }
    func restoreIpAddresses(_ s: String) -> [String] {
        if s.count < 4 { return [] }
        sss = s
        back(0, [])
        return res
    }
}

class Solution93_1 {
    func restoreIpAddresses(_ s: String) -> [String] {
        var res = [String]()
        var tmp = [String]()
    
        let chs: [Character] = [Character](s)
        backTrace(&res, &tmp, chs, 0, 0)
        return res
    }
    func backTrace(_ res: inout [String], _ tmp: inout [String], _ chs: [Character], _ index: Int, _ has: Int) {
        if index == chs.count && has == 4 {
            res.append(tmp.joined(separator: "."))
            return
        }
        if (has == 4 && index < chs.count) || (index == chs.count && has < 4) {
            return
        }
        for i in index ... index+2 {
            if i >= chs.count { break }
            if i > index && chs[index] == "0" { break }
            let str: String = String(chs[index...i])
            if str.count == 3 && str > "255" {
                continue
            }
            tmp.append(str)
            backTrace(&res, &tmp, chs, i + 1, has + 1)
            tmp.removeLast()
        }
    }
    
}
