//
//  17.-电话号码的字母组合.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution17 {
    let dict: [Character: String] = [
        "0": "",
        "1": "",
        "2": "abc",
        "3": "def",
        "4": "ghi",
        "5": "jkl",
        "6": "mno",
        "7": "pqrs",
        "8": "tuv",
        "9": "wxyz"
    ]
    // MARK: 回溯
    func letterCombinations(_ digits: String) -> [String] {
    
        if digits.count == 0 {
            return []
        }
        var res = [String]()
        var track = [Character]()
        backtrack(digits, 0, &track, &res)
        return res
    }
    
    func backtrack(_ digits: String, _ start: Int, _ track: inout [Character], _ res: inout [String]) {
        if track.count == digits.count {
            res.append(String(track))
            return
        }
        let chars = Array(digits)
        for i in start..<digits.count {
            let s = Array(dict[chars[i]]!)
            for c in s {
                track.append(c)
                backtrack(digits, i + 1, &track, &res)
                track.removeLast()
            }
        }
    }
    
    // MARK: 深度优先
    func letterCombinations_dfs(_ digits: String) -> [String] {
        let tmpDict = ["", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
        var res = [String]()
        for v in digits.map({ Int(String($0))! }) {
            res = (res.isEmpty ? [""] : res).flatMap({ s in
                tmpDict[v].map { "\($0)" }.map { s + $0 }
            })
        }
        return res
    }
    
    func letterCombinations_for2(_ digits: String) -> [String] {
        if digits.count == 0 { return [] }
        let dic = ["2":["a", "b", "c"],
                   "3":["d", "e", "f"],
                   "4":["g", "h", "i"],
                   "5":["j", "k", "l"],
                   "6":["m", "n", "o"],
                   "7":["p", "q", "r", "s"],
                   "8":["t", "u", "v"],
                   "9":["w", "x", "y", "z"]]
        var res = [""]
        for i in digits {
            let n: [String] = dic[String(i)]!
            var temp = [String]()
            for j in n {
                for z in res {
                    temp.append(z + j)
                }
            }
            res = temp
        }
        return res;
    }
}
