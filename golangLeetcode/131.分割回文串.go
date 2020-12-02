/*
 * @lc app=leetcode.cn id=131 lang=golang
 *
 * [131] 分割回文串
 */

// @lc code=start
func partition(s string) [][]string {
	res := make([][]string, 0)
	cur := make([]string, 0)
	trackBack(s, 0, cur, &res)
	return res

}

func trackBack(s string, index int, cur []string, res *[][]string) {
	if len(s) == index {
		tmp := make([]string, len(cur))
		copy(tmp, cur)
		*res = append(*res, cur)
		return
	}
	for i := index; i < len(s); i++ {
		if checkHuiwen(s[index : i+1]) {
			cur = append(cur, s[index:i+1])
			trackBack(s, i+1, cur, res)
			cur = cur[:len(cur)-1]
		}
	}
}

func checkHuiwen(s string) bool {
	i, j := 0, len(s)-1
	for i < j {
		if s[i] == s[j] {
			i += 1
			j -= 1
		} else {
			return false
		}
	}
	return true
}

// @lc code=end

