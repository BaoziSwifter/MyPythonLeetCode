//
//  832.-翻转图像.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution832 {
    func flipAndInvertImage(_ image: [[Int]]) -> [[Int]] {
        var image = image
        let n = image.count
        for i in 0..<n {
            let cnt = n / 2
            for j in 0..<cnt {
                let left =  image[i][j]
                let right = image[i][n - 1 - j]
                (image[i][j], image[i][n - 1 - j]) = (right == 1 ? 0 : 1, left == 1 ? 0 : 1)
            }
            if n % 2 == 1 {
                image[i][cnt] = image[i][cnt] == 1 ? 0 : 1
            }
        }
        return image
    }
}
