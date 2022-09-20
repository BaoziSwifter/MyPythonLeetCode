//
//  406.-根据身高重建队列.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation


class Solution406 {
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        if people.isEmpty { return people }
        var peopleSort = people.sorted { a, b in
            if a[0] == b[0] {
                return a[1] < b[1]
            } else {
                return a[0]>b[0]
            }
        }
        var res = [[Int]]()
        for item in peopleSort {
            res.insert(item, at: item[1])
        }
        return res
    }
}
