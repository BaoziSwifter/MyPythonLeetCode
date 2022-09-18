/*
 * @lc app=leetcode.cn id=239 lang=swift
 *
 * [239] 滑动窗口最大值
 */

// @lc code=start
class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        //使用优先队列 和 单调队列的方法，
        //此处为单调队列的方式,第0个就是最大的值
        var list = [Int]()
        var ans = [Int]()
        var left = 0
        for right in 0..<nums.count{
            let len = right - left + 1
            while !list.isEmpty && list.last! < nums[right]{
                list.removeLast()
            }
            list.append(nums[right])
            
            if len < k{
                continue
            }
            ans.append(list[0])
            //是否左移掉的最大元素
            if nums[left] == list[0]{
                //list.removeFirst() 这种写法会超时
                list = Array(list[1..<list.count])
            }
            left += 1
        }
        return ans
    }
}
// @lc code=end

