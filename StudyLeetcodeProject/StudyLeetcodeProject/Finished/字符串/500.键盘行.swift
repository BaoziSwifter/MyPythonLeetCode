//
//  500.-键盘行.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution500 {
    func findWords(_ words: [String]) -> [String] {
        let set1: Set<Character> = ["Q","W","E","R","T","Y","U","I","O","P","q","w","e","r","t","y","u","i","o","p"]
        let set2: Set<Character> = ["A","S","D","F","G","H","J","K","L","a","s","d","f","g","h","j","k","l"]
        let set3: Set<Character> = ["Z","X","C","V","B","N","M","z","x","c","v","b","n","m"]
        func findWord(_ word: String) -> Bool {
            var (row1, row2, row3) = (0, 0, 0)
            for ch in word {
                if row1 == 0 {
                    row1 = set1.contains(ch) ? 1 : 0
                }
                if row2 == 0 {
                    row2 = set2.contains(ch) ? 1 : 0
                }
                if row3 == 0 {
                    row3 = set3.contains(ch) ? 1 : 0
                }
            }
            return row3 + row2 + row1 == 1
        }
        var res = [String]()
        for word in words {
            if findWord(word) {
                res.append(word)
            }
        }
        return res
    }
}
