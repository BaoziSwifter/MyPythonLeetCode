// leetcode 189.旋转数组.swift
class RotateArrayTowardRightK {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let count = nums.count
        var step = k % count
        while step != 0 {
            let a = nums.removeLast()
            nums.insert(a, at: 0)
            step -= 1
        }
    }
}
