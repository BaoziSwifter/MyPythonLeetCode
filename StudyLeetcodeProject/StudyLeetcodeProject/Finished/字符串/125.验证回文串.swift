//
//  125.-验证回文串.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution125 {
    func isPalindrome(_ s: String) -> Bool {
        //1.字符和数字过滤出来，过滤完了转成大写(uppercased)或者小写(lowercased)
        let str = s.filter { $0.isLetter || $0.isNumber }.lowercased()
        //2.把过滤完的字符串继续反转比较
        return str == String(str.reversed())
    }
}
