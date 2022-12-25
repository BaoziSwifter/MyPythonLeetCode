//
//  804.-唯一摩尔斯密码词.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution804 {
    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        let mosArr = [".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."]
        var res: Set<String> = Set()
        
        let startVal:Character = "a"
        for word in words {
            var tempRes = ""
            for c in word {
                let index = Int(c.asciiValue! - startVal.asciiValue!)
                tempRes += mosArr[index]
            }
            res.insert(tempRes)
        }
        return res.count
    }
}
