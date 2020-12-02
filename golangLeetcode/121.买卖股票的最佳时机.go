/*
 * @lc app=leetcode.cn id=121 lang=golang
 *
 * [121] 买卖股票的最佳时机
 */

// @lc code=start
func maxProfit(prices []int) int {
	if len(prices) <= 1 {
		return 0
	}
	minVal := prices[0]
	sumVal := 0
	for _, v := range prices {
		if minVal < v {
			tmp := v - minVal
			if tmp > sumVal {
				sumVal = tmp
			}
		} else {
			minVal = v
		}
	}
	return sumVal
}

// @lc code=end

