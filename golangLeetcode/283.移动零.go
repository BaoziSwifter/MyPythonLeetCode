/*
 * @lc app=leetcode.cn id=283 lang=golang
 *
 * [283] 移动零
 */

// @lc code=start
func moveZeroes(nums []int) {
	if len(nums) < 2 {
		return
	}
	// method 1
	// zIndex := -1
	// for i := 0; i < len(nums); {
	// 	if zIndex != -1 {
	// 		if nums[i] != 0 {
	// 			nums[i], nums[zIndex] = nums[zIndex], nums[i]
	// 			i = zIndex
	// 			zIndex = -1
	// 		} else {
	// 			i++
	// 		}
	// 	} else {
	// 		if nums[i] == 0 {
	// 			zIndex = i
	// 		}
	// 		i++
	// 	}
	// }

	// methd 2
	for i, j := 0, 0; i < len(nums) && j < len(nums); {
		if nums[i] == 0 && nums[j] != 0 {
			nums[i], nums[j] = nums[j], nums[i]
			j++
		} else if nums[i] == 0 && nums[j] == 0 {
			j++
		} else if nums[i] != 0 && nums[j] == 0 {
			i++
		} else {
			i++
			if i > j {
				j++
			}
		}
	}

}

// @lc code=end

