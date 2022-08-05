/*
 * @lc app=leetcode.cn id=122 lang=golang
 *
 * [122] 买卖股票的最佳时机 II
 */

// @lc code=start
func maxProfit(prices []int) int {
	if len(prices) <= 1 {
		return 0
	}
	maxVal := 0
	lastMin := prices[0]
	for _, val := range prices {
		if val > lastMin {
			maxVal += (val - lastMin)
		}
		lastMin = val

	}
	return maxVal

}

// @lc code=end

