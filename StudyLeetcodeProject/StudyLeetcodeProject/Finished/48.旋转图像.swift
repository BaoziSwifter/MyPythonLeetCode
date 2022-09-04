//
//  48.旋转图像.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation


class Solution48 {
    // 镜像法
    // 顺时针旋转
    func rotate_right(_ a: inout [[Int]]) {
        let n = a.count
        for i in 0..<n {
            for j in i..<n {
                (a[i][j], a[j][i]) = (a[j][i], a[i][j])
            }
        }
        for i in 0..<n {
            for j in 0..<n/2 {
                (a[i][j], a[i][n - j - 1]) = (a[i][n - j - 1], a[i][j])
            }
        }
    }
    // 镜像法
    // 逆时针
    func rotate_left(_ a: inout [[Int]]) {
        let n = a.count
        for i in 0..<n {
            for j in 0..<n-i {
                (a[i][j], a[n - i - 1][n - j - 1]) = (a[n - i - 1][n - j - 1], a[i][j])
            }
        }
        for i in 0..<n {
            for j in 0..<n/2 {
                (a[i][j], a[i][n - j - 1]) = (a[i][n - j - 1], a[i][j])
            }
        }
    }
    
    // 循环法
    func rotate_direct(_ a: inout [[Int]]) {
        let n = a.count
        for i in 0..<n/2 {
            for j in i..<n-i-1 {
                (a[i][j],a[j][n-i-1],a[n-i-1][n-j-1],a[n-j-1][i]) = (a[n-j-1][i], a[i][j],a[j][n-i-1],a[n-i-1][n-j-1])
            }
        }
                
    }
    
}
