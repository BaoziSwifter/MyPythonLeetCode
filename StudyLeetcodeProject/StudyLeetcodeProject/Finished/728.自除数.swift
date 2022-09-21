//
//  728.-自除数.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution728 {
    func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
        var res = [Int]()
      
        for i in left...right {
          //! 判断是否是自除数
          var num = i
          var flag = true
          while num != 0 {
            let temp = num % 10
            if temp == 0 ||  i % temp != 0 {
              flag = false
              break
            }
            num = num / 10
          }
        
          if flag == true {
            res.append(i)
          }
        }
        return res
    }
}
