//215.数组中的第K个最大元素.swift
class FindKthLargest {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        // 基于快排思想
        return quickSelect(nums, 0, nums.count - 1, nums.count - k)
    }

    func quickSelect(_ nums:[Int], _ left: Int, _ right: Int, _ targetIndex: Int) -> Int {
        var nums = nums
        let index = partition(&nums, left, right)
        if index == targetIndex {
            return nums[index]
        }
        return index > targetIndex ? quickSelect(nums, left, index-1, targetIndex) : quickSelect(nums, index+1, right, targetIndex)
    }

    func partition(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
        let selectNum = nums[left]
        var i = left, j = right
        while i < j {
            while i < j && selectNum <= nums[j] {
                j -= 1
            }
            nums.swapAt(i, j)
            while i < j && selectNum >= nums[i] {
                i += 1
            }
            nums.swapAt(i,j)
        }
        return i
    }

}
