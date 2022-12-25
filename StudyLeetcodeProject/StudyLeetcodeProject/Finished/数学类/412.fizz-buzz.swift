//
//  412.-fizz-buzz.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution412 {
    func fizzBuzz(_ n: Int) -> [String] {
        var tmp:[String] = []
        for i in 1...n {
            if i%5 == 0 && i%3 == 0 {
                tmp.append("FizzBuzz")
            }else if i%3 == 0 {
                tmp.append("Fizz")
            }else if i%5 == 0 {
                tmp.append("Buzz")
            }else{
                tmp.append("\(i)")
            }
        }
        return tmp
    }
}
