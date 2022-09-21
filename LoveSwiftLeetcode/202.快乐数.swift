/*
 * @lc app=leetcode.cn id=202 lang=swift
 *
 * [202] 快乐数
 */

// @lc code=start
class Solution {
    func isHappy(_ n: Int) -> Bool {
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
// @lc code=end

