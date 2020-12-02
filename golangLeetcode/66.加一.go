/*
 * @lc app=leetcode.cn id=66 lang=golang
 *
 * [66] 加一
 */

// @lc code=start
func plusOne(digits []int) []int {
	scale := 1
	l := len(digits)
	for i := 0; i < l; i++ {
		tmp := digits[l-i-1] + scale
		scale = tmp / 10
		digits[l-i-1] = tmp % 10
		if scale == 0 {
			break
		}
	}
	if scale == 1 {
		res := make([]int, 1)
		res[0] = 1
		digits = append(res, digits...)
	}
	return digits
}

// @lc code=end

