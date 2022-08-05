/*
 * @lc app=leetcode.cn id=26 lang=golang
 *
 * [26] 删除排序数组中的重复项
 */

// @lc code=start
func removeDuplicates(nums []int) int {

	if len(nums) == 0 {
		return 0
	}
	// lastVal := nums[0]
	// for i := 1; i < len(nums); {
	// 	if lastVal == nums[i] {
	// 		nums = append(nums[:i], nums[i+1:]...)
	// 	} else {
	// 		lastVal = nums[i]
	// 		i++
	// 	}
	// }
	// return len(nums)
	l := 0
	for i := 1; i < len(nums); i++ {
		if nums[l] != nums[i] {
			nums[l+1] = nums[i]
			l++
		}
	}
	return l + 1
}

// @lc code=end

