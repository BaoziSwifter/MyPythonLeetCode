//
//  215.-数组中的第k个最大元素.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

// 1. 排序法
class Solution215 {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let cnt = nums.count
        if k > cnt {
            return 0
        }
        let tmp = nums.sorted()
        return tmp[cnt-k]
    }
}

// 2. 基于快排序
class Solution215_1 {
    var nums: [Int]!
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        self.nums = nums
        let res = quickSelect(0, nums.count - 1, nums.count - k)
        return res
    }
    
    func quickSelect(_ left: Int, _ right: Int, _ index: Int) -> Int {
        // 找到分区点
        let q = randomPartition(left, right)
        if q == index {
            return nums[q]
        } else {
            return q < index ? quickSelect(q + 1, right, index) : quickSelect(left, q - 1, index)
        }
    }
    
    func randomPartition(_ left: Int, _ right: Int) -> Int {
        if left >= right {
            return left
        }
        
        // 参考值
        let x = nums[right]
        // 分区边界， i是第一个不小于x的坐标，也就是左侧边界
        var i = left
        for j in left..<right {
            if nums[j] < x {
                nums.swapAt(i, j)
                i += 1
            }
        }
        nums.swapAt(i, right)
        return i
    }
}

class Solution215_2 {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        if nums.isEmpty || k == 0 {
            return 0
        }
        var nums1 = nums
        let length = nums1.count
        quickSearch(&nums1, 0, length - 1, length - k)
        
        return nums1[length - k]
    }

    func quickSearch(_ arr: inout [Int], _ low: Int, _ high: Int, _ k: Int) {
        let res = partition(&arr, low: low, high: high)
        if res == k {
            return
        }
        else if res > k {
            quickSearch(&arr, low, res-1, k)
        }
        else {
            quickSearch(&arr, res+1, high, k)
        }
    }

    func partition(_ arr: inout [Int], low: Int, high: Int) -> Int {
        var l = low
        var h = high
        while l < h {
            while (l < h && arr[h] >= arr[low]) {
                h = h - 1;
            }
            while (l < h && arr[l] <= arr[low]) {
                l = l + 1;
            }
            (arr[l], arr[h]) = (arr[h], arr[l])
        }
        (arr[low], arr[l]) = (arr[l], arr[low])
        return l // 返回tmp的正确位置
    }
}

