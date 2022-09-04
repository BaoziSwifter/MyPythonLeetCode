//
//  54.螺旋矩阵.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/19.
//

import Foundation

class Solution54 {
    func spiralOrder(_ a: [[Int]]) -> [Int] {
        var res = [Int]()
        let n = a.count
        let m = a[0].count
        var l = 0, r = m - 1
        var t = 0, b = n - 1
        while res.count < m * n {
            if t <= b {
                var j = l
                while j <= r {
                    res.append(a[t][j])
                    j += 1
                }
                t += 1
            }
            if l <= r {
                var j = t
                while j <= b {
                    res.append(a[j][r])
                    j += 1
                }
                r -= 1
            }
            if t <= b {
                var j = r
                while j >= l {
                    res.append(a[b][j])
                    j -= 1
                }
                b -= 1
            }
            if l <= r {
                var j = b
                while j >= t {
                    res.append(a[j][l])
                    j -= 1
                }
                l += 1
            }
        }
        return res
        
//        if a.count == 0 {
//          return []
//        }
//
//        if a[0].count == 0 {
//          return []
//        }
//
//        var res = [Int]()
//
//        var top = 0
//        var bottom = a.count - 1
//        var left = 0
//        var right = a[0].count - 1
//
//
//        while top <= bottom && left <= right {
//          //! 左上 到  右上
//          var index = left
//          while index <= right {
//            res.append(a[top][index])
//            index += 1
//          }
//
//          top += 1
//          //! 右上到右下
//          index = top
//          while index <= bottom {
//            res.append(a[index][right])
//            index += 1
//          }
//
//          right -= 1
//
//          if top > bottom || left > right {
//            break
//          }
//
//          //! 右下到左下
//          index = right
//          while index >= left {
//            res.append(a[bottom][index])
//            index -= 1
//          }
//
//          bottom -= 1
//
//          //! 左下 到 左上
//          index = bottom
//          while index >= top {
//            res.append(a[index][left])
//            index -= 1
//          }
//
//          left += 1
//
//        }
//        return res
      
    }
}
