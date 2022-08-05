/*
 * @lc app=leetcode.cn id=70 lang=golang
 *
 * [70] 爬楼梯
 */

// @lc code=start
func climbStairs(n int) int {
	if n < 1 {
		return 0
	}
	first := 0
	second := 1

	for step := 0; step < n; step++ {
		first, second = second, second+first
	}
	return second
}

// @lc code=end

