//
//  263.-丑数.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/13.
//

import Foundation

class Solution263 {
    func isUgly(_ num: Int) -> Bool {
        if num < 1 { return false }
          var n = num
          while n%2 == 0 { n/=2 }
          while n%3 == 0 { n/=3 }
          while n%5 == 0 { n/=5 }
          return n == 1
    }
}
