//
//  347.-前-k-个高频元素.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/4.
//

import Foundation

class Solution347 {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var map = [Int: Int]()
        for v in nums {
            map[v, default: 0] += 1
        }
        if map.count <= k { return [Int](map.keys) }
        let res = map.sorted { v1, v2 in
            v1.value > v2.value
        }.compactMap { (key: Int, value: Int) in
            key
        }
        return Array(res[..<k])
    }
    func topKFrequent_buckets(_ nums: [Int], _ k: Int) -> [Int] {
        var map = [Int: Int]()
        for v in nums {
            map[v, default: 0] += 1
        }
        var bucket = [[Int]](repeating:[], count: nums.count + 1)
        for v in map {
            bucket[v.value].append(v.key)
        }
        var res = [Int]()
        var k = k
        for b in bucket.reversed() {
            if b.isEmpty {
                continue
            }
            res.append(contentsOf: b)
            k -= b.count
            if k <= 0 { break }
        }
        return res
    }
}
