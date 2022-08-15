/*
 * @lc app=leetcode.cn id=15 lang=swift
 *
 * [15] 三数之和
 */

// @lc code=start
class ThreeSumSolution {
    func threeSum1(_ nums: [Int]) -> [[Int]] {
        var res = Set<[Int]>()
        let allCount = nums.count
        for i in 0 ..< allCount {
            for j in (i+1) ..< allCount {
                for k in (j+1) ..< allCount{
                    if nums[i]+nums[j]+nums[k] == 0 {
                        var item = [nums[i], nums[j], nums[k]]
                        item.sort()
                        res.insert(item)
                    }
                }
                
            }

        }
        var result = [[Int]]()
        for v in res {
            result.append(v)
        }
        return result
    }

    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {
            return []
        }
        var nums = nums
        nums.sort()
        var res = [[Int]]()
        for i in 0..<(nums.count - 2) {
            if nums[i] > 0 {
                break
            }

            if i > 0 && nums[i] == nums[i-1]{
                continue
            }

            var l = i + 1
            var r = nums.count - 1
            while l < r {
                let result = nums[i]+nums[l]+nums[r]
                if result == 0 {
                    res.append([nums[i], nums[l], nums[r]])
                    repeat {
                        l += 1
                    }while l < r && nums[l] == nums[l-1]

                    repeat {
                        r -= 1
                    }while l < r && nums[r] == nums[r+1]
                }else if result < 0 {
                    repeat{
                        l += 1
                    }while l < r && nums[l] == nums[l-1]
                }else {
                    repeat {
                        r -= 1
                    }while l < r && nums[r] == nums[r+1]
                }
            }
        }
        return res

    }
}
// @lc code=end

