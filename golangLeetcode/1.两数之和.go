/*
 * @lc app=leetcode.cn id=1 lang=golang
 *
 * [1] 两数之和
 */

// @lc code=start
func twoSum(nums []int, target int) []int {
	resMap := make(map[int]int)
	for i, v := range nums {
		if j, ok := resMap[target-v]; ok {
			return []int{i, j}
		} else {
			resMap[v] = i
		}
	}
	return []int{-1, -1}
}

// @lc code=end

