//
//  169.-多数元素.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution169 {
    // 多数元素是指在数组中出现次数大于 ⌊ n/2 ⌋ 的元素。也就是说 多数元素至少占总数组的一半以上，那么在排序好的数组中，多数元素肯定在数组中间也有出现
    func majorityElement(_ nums: [Int]) -> Int {
        return nums.sorted()[nums.count / 2]
    }
    
    // hash
    func majorityElement_hash(_ nums: [Int]) -> Int {
        var hashMap = [Int: Int]()
        let cnt = nums.count
        for i in nums {
            hashMap[i, default: 0] += 1
            if hashMap[i]! > cnt / 2 {
                return i
            }
        }
        return nums[0]
    }
    
    //分治法
    func majorityElement_divd(_ nums: [Int]) -> Int {
        func countInRange(_ nums: [Int], _ majNum: Int, _ left: Int, _ right: Int) -> Int {
            var cnt = 0
            for i in left...right {
                if nums[i] == majNum {
                    cnt += 1
                }
            }
            return cnt
        }
        func majorityElement(_ nums: [Int], _ left: Int, _ right: Int) -> Int {
            if left == right {
                return nums[left]
            }
            let mid = (left + right) / 2
            let leftNum = majorityElement(nums, left, mid)
            let rightNum = majorityElement(nums, mid + 1, right)
            if leftNum == rightNum {
                return leftNum
            }
            let leftCnt = countInRange(nums, leftNum, left, mid)
            let rightCnt = countInRange(nums, rightNum, mid + 1, right)
            return leftCnt > rightCnt ? leftNum : rightNum
        }
        return majorityElement(nums, 0, nums.count - 1)
    }
    // 随机化
    func majorityElement_random(_ nums: [Int]) -> Int {

      while true {
        //! 随机角标 取出元素
        let index =  Int.random(in: 0..<nums.count)
        let candidate = nums[index]
        var count = 0
        for num in nums {
          if num == candidate {
            count += 1
          }
          if count > nums.count/2 {
            return candidate
          }
        }
      }
    }

}
