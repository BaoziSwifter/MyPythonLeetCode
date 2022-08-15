import Foundation

// leetcode offer 39
class Solution_offer_39 {
    func majorityElement_math(_ nums: [Int]) -> Int {
        var num = nums[0]
        var count = 1
        for i in 1..<nums.count {
            let tmp = nums[i]
            if num == tmp {
                count += 1
            } else {
                count -= 1
            }
            if count == 0 {
                num = tmp
                count = 1
            }
        }
        return num
    }
    
    func majorityElement_sorted(_ nums: [Int]) -> Int {
        let n = nums.sorted(by: <)
        return n[n.count/2]
    }
}

