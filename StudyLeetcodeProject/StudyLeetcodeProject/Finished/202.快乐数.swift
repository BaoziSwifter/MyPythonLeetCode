//
//  202.-快乐数.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution202 {
    let map: [Int: Int] = [0: 0, 1: 1, 2: 4, 3: 9, 4: 16, 5: 25, 6: 36, 7: 49, 8: 64, 9: 81]
    func isHappy(_ n: Int) -> Bool {
        var set: Set<Int> = []
            
        if set.contains(n) {
            return false
        }
        
        set.insert(n)
        
        if n == 1 {
            return true
        }
        
        var m = n
        var total = 0
        while m != 0 {
            total += map[(m % 10)]!
            m = m / 10
        }
        
        return isHappy(total)
        
    }
    
    func isHappy_1(_ n: Int) -> Bool {
      if n <= 1 {
        return true
      }
   
      //! 快慢指针
      var slowNum = n
      var fastNum = getNext(n)
      while fastNum != 1 && slowNum != fastNum {
        slowNum = getNext(slowNum)
        fastNum = getNext(getNext(fastNum))
      }
      return fastNum==1
    }
       
    //! 获取下一个转换数
    func getNext(_ n:Int) -> Int {
         
      var newN = 0
      var n = n
      while n != 0 {
        let d = n%10
        newN += d*d
        n = n/10
      }
      return newN
    }

}
