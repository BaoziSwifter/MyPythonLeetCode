/*
 * @lc app=leetcode.cn id=350 lang=golang
 *
 * [350] 两个数组的交集 II
 */

// @lc code=start
func intersect(nums1 []int, nums2 []int) []int {
	sortmap := map[int]int{}
	for _, v := range nums1 {
		sortmap[v] += 1
	}

	res := make([]int, 0)
	for _, v := range nums2 {
		if cnt, ok := sortmap[v]; ok && cnt > 0 {
			res = append(res, v)
			sortmap[v] -= 1
		}
	}
	return res

}

// @lc code=end

